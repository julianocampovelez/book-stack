/// A generic class that represents a value that can be either of two types: `L` (left) or `R` (right).
///
/// The `Either` type is commonly used to model computations or data structures
/// that can result in two distinct outcomes, such as success (`Right`) or failure (`Left`).
abstract class Either<L, R> {
  /// Executes one of two callbacks depending on whether the current instance is `Left` or `Right`.
  ///
  /// - If the instance is `Left`, the `left` callback is invoked with the contained value of type `L`.
  /// - If the instance is `Right`, the `right` callback is invoked with the contained value of type `R`.
  ///
  /// Returns the result of the executed callback as type `T`.
  T when<T>(T Function(L) left, T Function(R) right) {
    if (this is Left) {
      // Casts the current instance to `Left` and invokes the `left` callback with its value.
      return left((this as Left<L, R>).value);
    }
    // Casts the current instance to `Right` and invokes the `right` callback with its value.
    return right((this as Right<L, R>).value);
  }
}

/// A subclass of `Either` representing the `Left` side of the `Either` type.
class Left<L, R> extends Either<L, R> {
  Left(this.value);

  final L value;
}

/// A subclass of `Either` representing the `Right` side of the `Either` type.
class Right<L, R> extends Either<L, R> {
  Right(this.value);

  final R value;
}
