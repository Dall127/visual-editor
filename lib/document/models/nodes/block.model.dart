part of 'node_models.dart';

final _blockUtils = BlockUtils();

// Represents a group of adjacent Lines with the same block style.
// Block elements are:
// - Blockquote
// - Header
// - Indent
// - List
// - Text Alignment
// - Text Direction
// - Code Block
final class BlockM extends ContainerM<LineM?> {
  // Creates new unmounted Block.
  @override
  NodeM newInstance() => BlockM();

  @override
  LineM get defaultChild => LineM();

  @override
  String toString() => _blockUtils.blockToString(this);
}
