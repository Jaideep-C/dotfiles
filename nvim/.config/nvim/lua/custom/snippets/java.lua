-- NOTE: Uncomment the below line when adding & testing new snippets
-- templates might accumalate because of sourceing it in run time :source java.lua

-- clear previous java snippets
-- require('luasnip.session.snippet_collection').clear_snippets 'java'

local ls = require 'luasnip'
local s = ls.snippet
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

local cp_template = s(
  'cptemp',
  fmt(
    [[
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.*;

public class Main {{

	public static void main(String[] args)
			throws FileNotFoundException {{
		FastScanner fs = new FastScanner(args);
		PrintWriter out = new PrintWriter(System.out);
		Solution.setIO(fs, out);

		if (Solution.IS_MULTI_TESTCASE) {{
			int t = fs.nextInt();
			for (int tt = 0; tt < t; tt++) {{
				Solution.solve();
			}}
			out.close();
			return;
		}}
		Solution.solve();
		out.close();
	}}
}}

class Solution {{
	public static boolean IS_MULTI_TESTCASE = true;
	private static FastScanner inp;
	private static PrintWriter out;

	public static void solve() {{
		{}
	}}
	
	@SuppressWarnings("unused")
	@SafeVarargs
	private static <T extends Comparable<T>> T min(T... values) {{
		return Arrays.stream(values).min(Comparator.naturalOrder()).orElse(null);
	}}

	@SuppressWarnings("unused")
	@SafeVarargs
	private static <T extends Comparable<T>> T max(T... values) {{
		return Arrays.stream(values).max(Comparator.naturalOrder()).orElse(null);
	}}
	
	public static void setIO(FastScanner input, PrintWriter output) {{
		inp = input;
		out = output;
	}}
}}

class FastScanner {{
	private final BufferedReader br;
	private StringTokenizer st = new StringTokenizer("");

	public FastScanner(String[] args)
			throws FileNotFoundException {{
		if (args.length == 1 && args[0].equals("LOCAL")) {{
			File file = new File(Objects.requireNonNull(getClass().getClassLoader().getResource("inp.txt"))
					.getFile());
			br = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
		}} else {{
			br = new BufferedReader(new InputStreamReader(System.in));
		}}
	}}

	String next() {{
		while (!st.hasMoreTokens()) {{
			try {{
				st = new StringTokenizer(br.readLine());
			}} catch (IOException e) {{
				System.out.println(e.getMessage());
			}}
		}}
		return st.nextToken();
	}}

	int nextInt() {{
		return Integer.parseInt(next());
	}}

	int[] nextIntArray(int n) {{
		int[] a = new int[n];
		for (int i = 0; i < n; i++) {{
			a[i] = nextInt();
		}}
		return a;
	}}

	long[] nextLongArray(int n) {{
		long[] a = new long[n];
		for (int i = 0; i < n; i++) {{
			a[i] = nextLong();
		}}
		return a;
	}}

	long nextLong() {{
		return Long.parseLong(next());
	}}
}}
]],
    {
      i(1),
    }
  )
)

ls.add_snippets('java', {
  cp_template,
})
