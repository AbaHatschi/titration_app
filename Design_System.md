# Titration App - Design System & Implementation Workflow

## Phase 1: Design System Definition

### 1.1 Color Palette

**Primary Colors (Sci-Fi Theme)**
```
Cyan:           #00ffff (Primary Action, Focus States)
Magenta:        #ff00ff (Secondary, Accents)
Dark Background: #0a0a1a (Main BG)
Input BG:       #1a1a2e (Input Fields, Cards)
Border Gray:    #2c2c44 (Inactive borders, gauge BG)
```

**Status Colors**
```
Success:        #00ff00 (Validation OK, status green)
Warning:        #ff9500 (Out of Range Low, caution)
Error/Danger:   #ff3b30 (Out of Range High, error)
Neutral:        #666666 (Disabled, Inactive)
Text Light:     #ffffff (Primary Text)
Text Dim:       #999999 (Secondary Text, timestamps)
```

**Implementation:**
- `lib/src/ui/core/theme/colors.dart` – Static constants

---

### 1.2 Typography

**Font Family**
```
Display (Headlines, Gauges): Orbitron (Google Fonts)
  - Weight: Bold (700)
  - Letter Spacing: 2.0
  - Usage: Headers, Gauge Labels, Buttons, Titles

Body (Input Fields, Info Text): Roboto Mono or Roboto (System)
  - Weight: Regular (400)
  - Letter Spacing: 0.5
  - Usage: Input hints, labels, descriptions, timestamps
```

**Font Sizes**
```
H1 (Dashboard Title):    36pt, Bold, Orbitron, LS: 2.0
H2 (Card Title):         20pt, Bold, Orbitron, LS: 1.5
H3 (Section/Gauge):      16pt, Bold, Orbitron, LS: 1.0
Body Large:              14pt, Regular, Roboto
Body Medium:             12pt, Regular, Roboto
Body Small:              11pt, Regular, Roboto
Timestamp:               10pt, Regular, Roboto Mono (monospace for alignment)
Button Text:             14pt, Bold, Orbitron, LS: 1.5
Input Hint:              13pt, Regular, Roboto (opacity: 60%)
```

**Implementation:**
- `lib/src/ui/core/theme/text_styles.dart` – TextStyle extensions

---

### 1.3 Spacing System (Gap Scale)

**Base Unit: 4px**
```
p4:   4px    (tiny, 1x)
p8:   8px    (2x)
p12:  12px   (3x)
p16:  16px   (4x) ← Most Common
p20:  20px   (5x)
p24:  24px   (6x)
p32:  32px   (8x)
p48:  48px   (12x, Large sections)
```

**Usage Rules**
```
Between Input Fields (within card):    p12
Between Gauge & Input:                 p16
Between Sections/Cards:                p24 - p32
Inside Input/Button Padding:           p12 (H), p8 (V)
Inside Card Padding:                   p16 (all sides)
Between title and content:             p12
```

---

### 1.4 Component Sizing

**Input Fields**
```
Height: 48px
Border Radius: 12px
Border Width: 2px
Padding: 12px (H), 12px (V)
Font Size: 13pt
```

**Gauges (Circular Display)**
```
Size: 120px × 120px
Stroke Width: 8px
Border Radius: 60px (circle)
Animation Duration: 500ms (value change)
Glow Shadow: 15px blur, 2px spread
```

**Buttons**
```
Height: 48px
Border Radius: 12px
Border Width: 2px
Padding: 16px (H)
Font Size: 14pt, Bold, Orbitron
Glow: Cyan (or Magenta for secondary)
```

**Cards**
```
Border Radius: 12px
Border Width: 2px
Border Color: Cyan #00ffff (60% opacity when inactive)
Background: #1a1a2e (80% opacity)
Padding: 16px (all sides)
Glow Shadow: 15px blur, Cyan (50% opacity)
Min Height: Depends on content
```

---

### 1.5 Shadows & Glows

**Box Shadows (for Cards, Inputs, Buttons)**
```
Glow Cyan:      blur 15px, spread 2px, color #00ffff (60% opacity)
Glow Magenta:   blur 15px, spread 2px, color #ff00ff (60% opacity)
Glow Warning:   blur 15px, spread 2px, color #ff9500 (60% opacity)
Glow Danger:    blur 15px, spread 2px, color #ff3b30 (60% opacity)
```

**Text Shadows (for Headers, Gauges)**
```
Blur: 8-10px
Color: Same as text (opacity 70%)
Offset: 0, 0 (centered)
```

**Focus/Hover Glow (Cards & Inputs)**
```
Activated on: Focus, Hover, Active State
Intensity: Increase shadow opacity to 100%
Animation: Smooth transition (200ms)
```

---

### 1.6 Animations

**Standard Transitions**
```
Input Focus:           200ms ease-out (border color + glow intensity)
Gauge Value Change:    500ms ease-out (arc sweep animation)
Button Hover:          150ms ease-out (glow intensity, slight scale)
Card Focus:            200ms ease-out (border glow)
Error Shake:           300ms (3x oscillation, ~5px offset)
Validation Pulse:      600ms (opacity pulse on icon)
```

---

## Phase 2: Dashboard Layout & Card Structure

### 2.1 Dashboard Overview (Main Screen)

The dashboard displays a summary card for each line (KegLine, LineOne, LineTwo).

**Screen Layout:**
```
[Header: Title + Navigation]
[Spacing: p24]
[KegLine Card]
[Spacing: p20]
[LineOne Card]
[Spacing: p20]
[LineTwo Card]
[Spacing: p24]
[Action Button (if needed)]
```

### 2.2 Card Structure (Per Line)

Each card contains:

```
┌─────────────────────────────────────┐
│ [Title] [Date/Time]    [Icon Nav]   │  ← Header Row
├─────────────────────────────────────┤
│ Letzte Messung: 4.82 ✓ (4.0-5.5)   │  ← Status Row (always visible)
│                        [Gauge]       │     Shows: Value, Status Icon, Tolerance
├─────────────────────────────────────┤
│ ⚠️ Unkorrigiert seit 2 Tage         │  ← Error Row (only if error exists)
│    Messung: 6.2 (Out of High)       │     Shows: Error icon, days since, value
│    [Dismiss Button]                  │
└─────────────────────────────────────┘
```

**Card Elements:**

**Header Row:**
- Title (e.g., "KegLine")
- Current Date/Time (HH:MM, DD.MM.YYYY)
- Navigation Icon Button (→ open full LineView)

**Status Row (Always Visible):**
- Label: "Letzte Messung:"
- Value: 4.82
- Status Icon: ✓ (success), ⚠️ (warning), ✗ (error) – color-coded
- Tolerance Range: (4.0-5.5)
- Optional: Small Gauge Widget (120px × 120px)

**Error Row (Conditional – Only if Error Exists):**
- Error Icon: ⚠️ (warning) or ✗ (danger)
- Error Message: "Unkorrigiert seit 2 Tage"
- Failed Value: "Messung: 6.2 (Out of High)"
- Dismiss Button: "✕" or "Ignore"

**Behavior:**
- Error auto-dismisses after 5 days
- Error disappears if new measurement on same day is within tolerance
- Error can be manually dismissed (explicit user action)

---

### 2.3 Individual Line View (Detail Screen)

When user taps navigation icon on card → Opens full LineView.

**KegLineView, LineOneView, LineTwoView Layout:**

```
[AppBar with Title + Back Button]
[Section: Last 5 Measurements]
  ├─ [Input Fields for new Measurement]
  ├─ [Gauge Display]
  └─ [Save Button]
[Section: Status Info]
  ├─ [Current Status Card]
  └─ [Error Card (if exists)]
[Section: Quick Actions]
  ├─ [Go to Dashboard Button]
  └─ [Other Navigation]
```

---

## Phase 3: Component Library

### 3.1 Animated Frame (Input Widget)

**Purpose:** Reusable input field with focus animation, validation states.

**States:**
- Normal (unfocused, cyan border 60% opacity)
- Focused (cyan border 100%, glow active, 200ms transition)
- Success (green border, checkmark icon)
- Error (red border, shake animation)
- Disabled (gray, no glow)

**Features:**
- Customizable border color (cyan, magenta, success, error)
- Smooth glow transition on focus
- Optional validation icon
- Pulse effect on error state

### 3.2 Animated Gauge (Display Widget)

**Purpose:** Circular gauge showing measurement value.

**Features:**
- Smooth arc animation (500ms ease-out) when value changes
- Gradient fill (cyan → magenta default)
- Color-coded based on status (green/orange/red)
- Centered label + value text
- Glow shadow effect
- Size: 120px × 120px (customizable)

### 3.3 Status Card

**Purpose:** Displays single line's status, last measurement, tolerance.

**Contains:**
- Title + DateTime
- Value display with status icon
- Tolerance range
- Optional: Small gauge or icon indicator

### 3.4 Error Card

**Purpose:** Persistent error reminder until resolved or dismissed.

**Contains:**
- Error icon (⚠️ or ✗)
- Error message + days elapsed
- Failed value + reason (Out of High/Low)
- Dismiss button

### 3.5 Dashboard Card (Composite)

**Purpose:** Container holding Status Card + Error Card together.

**Contains:**
- Header (Title + DateTime + Nav Icon)
- Status Row
- Error Row (conditional)

---

## Phase 4: File Structure

```
lib/src/ui/core/
├── theme/
│   ├── colors.dart              ← All color constants
│   ├── text_styles.dart         ← All TextStyle definitions
│   └── app_theme.dart           ← ThemeData + global theme config
├── constants/
│   ├── sizes.dart               ← Gap & size constants
│   └── gaps.dart                ← (existing, keep as is)
├── widgets/
│   ├── animated_frame.dart      ← Input field with animation
│   ├── animated_gauge.dart      ← Circular gauge display
│   ├── status_card.dart         ← Status + value display
│   ├── error_card.dart          ← Error reminder card
│   ├── dashboard_card.dart      ← Composite (Status + Error)
│   └── validation_indicator.dart ← Small icon indicator

lib/src/ui/features/
├── dashboard/
│   ├── dashboard_view.dart      ← Main dashboard (3 cards)
│   └── dashboard_view_model.dart ← Logic for dashboard
├── keg_line/
│   ├── keg_line_view.dart       ← Detail view (refactored)
│   └── keg_line_view_model.dart ← (already exists)
├── line_one/
│   ├── line_one_view.dart       ← Detail view (refactored)
│   └── line_one_view_model.dart ← (already exists)
└── line_two/
    ├── line_two_view.dart       ← Detail view (refactored)
    └── line_two_view_model.dart ← (already exists)
```

---

## Phase 5: Implementation Workflow

### Step 1: Build Theme System
- [ ] Create `colors.dart` – All constants (primary, status, text, shadows)
- [ ] Create `text_styles.dart` – All TextStyle definitions with extensions
- [ ] Create `sizes.dart` – Gaps, border radius, heights
- [ ] Create `app_theme.dart` – Centralized ThemeData configuration
- [ ] Test: Compile without errors, check constants are accessible

### Step 2: Create Base Components
- [ ] Create `animated_frame.dart` – Reusable input with focus animation
- [ ] Create `animated_gauge.dart` – Circular gauge with smooth value animation
- [ ] Create `validation_indicator.dart` – Small icon status display
- [ ] Test: Each component displays correctly, animations smooth

### Step 3: Create Card Components
- [ ] Create `status_card.dart` – Last measurement + tolerance display
- [ ] Create `error_card.dart` – Error reminder with dismiss
- [ ] Create `dashboard_card.dart` – Composite (status + error)
- [ ] Test: Cards render correctly, error logic works (5-day auto-dismiss)

### Step 4: Build Dashboard View
- [ ] Create `dashboard_view.dart` – Three dashboard cards
- [ ] Create `dashboard_view_model.dart` – Load all three lines, handle error states
- [ ] Wire up navigation (tap card icon → open detail view)
- [ ] Test: Dashboard loads all data, cards display correctly

### Step 5: Refactor Detail Views
- [ ] Refactor `keg_line_view.dart` – Use new components (animated_frame, gauge, cards)
- [ ] Refactor `line_one_view.dart` – Same as above
- [ ] Refactor `line_two_view.dart` – Same as above
- [ ] Test: All views render, animations smooth, data flows correctly

### Step 6: Polish & Testing
- [ ] Animation timing/smoothness
- [ ] Color contrast & readability
- [ ] Touch/focus states (especially on cards & inputs)
- [ ] Error state handling (5-day auto-dismiss logic)
- [ ] Memory cleanup (animations dispose correctly)
- [ ] Responsive layout (small/medium/large screens)

---

## Phase 6: Error Handling & Persistence

**Error Storage:** Leverage existing timestamp in entity.

**Auto-Dismiss Logic:**
```dart
bool shouldDeleteError(DateTime errorTimestamp) {
  final fiveDaysAgo = DateTime.now().subtract(const Duration(days: 5));
  return errorTimestamp.isBefore(fiveDaysAgo);
}
```

**Error State Rules:**
1. New measurement on same day, within tolerance → Error disappears, status updates
2. New measurement on same day, out of tolerance → Error persists, status shows new value
3. Error older than 5 days → Auto-dismiss (delete from display)
4. User taps dismiss button → Error dismissed immediately (can be re-shown if occurs again)

**Implementation Location:**
- Repository: Filter errors on fetch (remove old ones)
- ViewModel: Check hasUnresolvedError before displaying error card
- View: Show/hide error card based on ViewModel flag

---

## Priority Checklist

**High Priority (Required for MVP):**
- [x] Color palette & theme constants
- [x] Typography system
- [ ] Animated frame component
- [ ] Animated gauge component
- [ ] Dashboard view with 3 cards
- [ ] Error card with 5-day logic

**Medium Priority (Polish & UX):**
- [ ] Validation indicator widget
- [ ] Smooth animations & transitions
- [ ] Touch states & focus management
- [ ] Responsive layout

**Low Priority (Nice-to-Have):**
- [ ] Advanced animations (shake, pulse)
- [ ] Accessibility (contrast, semantic labels)
- [ ] Performance optimization

---

## Next Action

Ready to start with **Step 1: Build Theme System**?

We'll create:
1. `colors.dart` 
2. `text_styles.dart`
3. `sizes.dart`
4. `app_theme.dart`

Then you'll have the foundation for everything else.

Go?