part of 'node_models.dart';

// Root node of document tree.
// Contains all the nodes that are generated out of the delta operations.
// Each Node is an fragment of text that has the same styling attributes.
final class RootM extends ContainerM<ContainerM<NodeM?>> {
  @override
  NodeM newInstance() => RootM();

  @override
  ContainerM<NodeM?> get defaultChild => LineM();
}
