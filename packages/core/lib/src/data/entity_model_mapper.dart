abstract class EntityModelMapper<E, M> {
  M toModel({required E entity});
  E toEntity({required M model});
}
