//
//  Copyright © 2016 Cleverlance. All rights reserved.
//


public func flatten<A, B, C>(_ input: ((A, B), C)) -> (A, B, C) {
	return (input.0.0, input.0.1, input.1)
}

public func flatten<A, B, C, D>(_ input: (((A, B), C), D)) -> (A, B, C, D) {
	return (input.0.0.0, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E>(_ input: ((((A, B), C), D), E)) -> (A, B, C, D, E) {
	return (input.0.0.0.0, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E, F>(_ input: (((((A, B), C), D), E), F)) -> (A, B, C, D, E, F) {
	return (input.0.0.0.0.0, input.0.0.0.0.1, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E, F, G>(_ input: ((((((A, B), C), D), E), F), G)) -> (A, B, C, D, E, F, G) {
	return (input.0.0.0.0.0.0, input.0.0.0.0.0.1, input.0.0.0.0.1, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E, F, G, H>(_ input: (((((((A, B), C), D), E), F), G), H)) -> (A, B, C, D, E, F, G, H) {
	return (input.0.0.0.0.0.0.0, input.0.0.0.0.0.0.1, input.0.0.0.0.0.1, input.0.0.0.0.1, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E, F, G, H, I>(_ input: ((((((((A, B), C), D), E), F), G), H), I)) -> (A, B, C, D, E, F, G, H, I) {
	return (input.0.0.0.0.0.0.0.0, input.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.1, input.0.0.0.0.0.1, input.0.0.0.0.1, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E, F, G, H, I, J>(_ input: (((((((((A, B), C), D), E), F), G), H), I), J)) -> (A, B, C, D, E, F, G, H, I, J) {
	return (input.0.0.0.0.0.0.0.0.0, input.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.1, input.0.0.0.0.0.1, input.0.0.0.0.1, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E, F, G, H, I, J, K>(_ input: ((((((((((A, B), C), D), E), F), G), H), I), J), K)) -> (A, B, C, D, E, F, G, H, I, J, K) {
	return (input.0.0.0.0.0.0.0.0.0.0, input.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.1, input.0.0.0.0.0.1, input.0.0.0.0.1, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E, F, G, H, I, J, K, L>(_ input: (((((((((((A, B), C), D), E), F), G), H), I), J), K), L)) -> (A, B, C, D, E, F, G, H, I, J, K, L) {
	return (input.0.0.0.0.0.0.0.0.0.0.0, input.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.1, input.0.0.0.0.0.1, input.0.0.0.0.1, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E, F, G, H, I, J, K, L, M>(_ input: ((((((((((((A, B), C), D), E), F), G), H), I), J), K), L), M)) -> (A, B, C, D, E, F, G, H, I, J, K, L, M) {
	return (input.0.0.0.0.0.0.0.0.0.0.0.0, input.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.1, input.0.0.0.0.0.1, input.0.0.0.0.1, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E, F, G, H, I, J, K, L, M, N>(_ input: (((((((((((((A, B), C), D), E), F), G), H), I), J), K), L), M), N)) -> (A, B, C, D, E, F, G, H, I, J, K, L, M, N) {
	return (input.0.0.0.0.0.0.0.0.0.0.0.0.0, input.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.1, input.0.0.0.0.0.1, input.0.0.0.0.1, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O>(_ input: ((((((((((((((A, B), C), D), E), F), G), H), I), J), K), L), M), N), O)) -> (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O) {
	return (input.0.0.0.0.0.0.0.0.0.0.0.0.0.0, input.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.1, input.0.0.0.0.0.1, input.0.0.0.0.1, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P>(_ input: (((((((((((((((A, B), C), D), E), F), G), H), I), J), K), L), M), N), O), P)) -> (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P) {
	return (input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0, input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.1, input.0.0.0.0.0.1, input.0.0.0.0.1, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q>(_ input: ((((((((((((((((A, B), C), D), E), F), G), H), I), J), K), L), M), N), O), P), Q)) -> (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q) {
	return (input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0, input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.1, input.0.0.0.0.0.1, input.0.0.0.0.1, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R>(_ input: (((((((((((((((((A, B), C), D), E), F), G), H), I), J), K), L), M), N), O), P), Q), R)) -> (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R) {
	return (input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0, input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.1, input.0.0.0.0.0.1, input.0.0.0.0.1, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S>(_ input: ((((((((((((((((((A, B), C), D), E), F), G), H), I), J), K), L), M), N), O), P), Q), R), S)) -> (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S) {
	return (input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0, input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.1, input.0.0.0.0.0.1, input.0.0.0.0.1, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

public func flatten<A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T>(_ input: (((((((((((((((((((A, B), C), D), E), F), G), H), I), J), K), L), M), N), O), P), Q), R), S), T)) -> (A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q, R, S, T) {
	return (input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0, input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.0.1, input.0.0.0.0.0.0.1, input.0.0.0.0.0.1, input.0.0.0.0.1, input.0.0.0.1, input.0.0.1, input.0.1, input.1)
}

