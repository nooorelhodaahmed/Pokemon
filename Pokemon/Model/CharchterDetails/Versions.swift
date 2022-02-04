/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Versions : Codable {
	let generation_i : Generation_i?
	let generation_ii : Generation_ii?
	let generation_iii : Generation_iii?
	let generation_iv : Generation_iv?
	let generation_v : Generation_v?
	let generation_vi : Generation_vi?
	let generation_vii : Generation_vii?
	let generation_viii : Generation_viii?

	enum CodingKeys: String, CodingKey {

		case generation_i = "generation-i"
		case generation_ii = "generation-ii"
		case generation_iii = "generation-iii"
		case generation_iv = "generation-iv"
		case generation_v = "generation-v"
		case generation_vi = "generation-vi"
		case generation_vii = "generation-vii"
		case generation_viii = "generation-viii"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		generation_i = try values.decodeIfPresent(Generation_i.self, forKey: .generation_i)
		generation_ii = try values.decodeIfPresent(Generation_ii.self, forKey: .generation_ii)
		generation_iii = try values.decodeIfPresent(Generation_iii.self, forKey: .generation_iii)
		generation_iv = try values.decodeIfPresent(Generation_iv.self, forKey: .generation_iv)
		generation_v = try values.decodeIfPresent(Generation_v.self, forKey: .generation_v)
		generation_vi = try values.decodeIfPresent(Generation_vi.self, forKey: .generation_vi)
		generation_vii = try values.decodeIfPresent(Generation_vii.self, forKey: .generation_vii)
		generation_viii = try values.decodeIfPresent(Generation_viii.self, forKey: .generation_viii)
	}

}
