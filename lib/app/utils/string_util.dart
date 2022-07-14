class StringUtil {
  static String capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1);
  }

  static String lorem() {
    return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec facilisis, eros eget lobortis hendrerit, libero neque commodo est, vitae ultrices diam sapien ut leo. In in suscipit lacus, vel auctor tellus. Nullam vel felis sed augue mollis placerat at nec lorem. Nullam non erat pretium, porta est non, rutrum risus. Mauris sit amet pellentesque urna. In interdum ligula nec lectus fermentum, vel dapibus lorem laoreet. Morbi placerat ullamcorper mi, ut condimentum dui facilisis quis. Nulla quis enim tristique, gravida nibh ut, sagittis dui. Nullam enim nisl, tincidunt maximus tempus in, ultrices quis dui.";
  }
}
