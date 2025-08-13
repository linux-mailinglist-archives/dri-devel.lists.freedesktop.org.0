Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8DBB25D1B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 09:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F179B10E7FE;
	Thu, 14 Aug 2025 07:25:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5424410E0BC;
 Wed, 13 Aug 2025 20:12:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id F27F8A57F1C;
 Wed, 13 Aug 2025 20:12:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4096C4CEEF;
 Wed, 13 Aug 2025 20:11:53 +0000 (UTC)
Date: Wed, 13 Aug 2025 21:11:51 +0100
From: Mark Brown <broonie@debian.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Breno Leitao <leitao@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
 Dave Ertman <david.m.ertman@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
 Jens Axboe <axboe@kernel.dk>, Alexandre Courbot <acourbot@nvidia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 00/19] rust: replace `kernel::c_str!` with C-Strings
Message-ID: <34d384af-6123-4602-bde0-85ca3d14fe09@sirena.org.uk>
References: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="6FVk2V0LrGBjdKpm"
Content-Disposition: inline
In-Reply-To: <20250813-core-cstr-cstrings-v2-0-00be80fc541b@gmail.com>
X-Cookie: Turn the other cheek.
X-Mailman-Approved-At: Thu, 14 Aug 2025 07:25:34 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6FVk2V0LrGBjdKpm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 11:59:10AM -0400, Tamir Duberstein wrote:
> This series depends on step 3[0] which depends on steps 2a[1] and 2b[2]
> which both depend on step 1[3].
>=20
> This series also has a minor merge conflict with a small change[4] that
> was taken through driver-core-testing. This series is marked as
> depending on that change; as such it contains the post-conflict patch.
>=20
> Subsystem maintainers: I would appreciate your `Acked-by`s so that this
> can be taken through Miguel's tree (where the previous series must go).

Something seems to have gone wrong with your posting, both my mail
server and the mail archives stop at patch 15.  If it were just rate
limiting or greylisting I'd have expected things to have sorted
themselves out by now for one or the other.

--6FVk2V0LrGBjdKpm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmic8YYACgkQJNaLcl1U
h9Cumwf/YkCiNa2FUFyl0xap34GT0uNu8Xh2QH5gQa+2jI19lL8u1OybvUdzWI8N
dryQmdo4BgnkEFiIeCiAWIUh8fHachIQqfAZfj8yJRexfSk3R0S/Nrg8CfGa9myh
jkwom0F4sUSvZpsacG1c/oCya64UwN/bCgC+Yw2fivCPjjw/vz1JE5gtarpJEQly
EJBbiexaSe0XYdtZ3cIT4wm0YElZqekk8U953MglLhWOOLXzt59bkslAam/8fori
si1u/uVgWv1vyziB8dYHRa26Gsgy9OkgjCD0P64YWkoAV/uSnxsEo5wtWBx2ys1n
pZ4kmgo8dh16iRQ7pqHeV2g3wE9HiQ==
=xgNk
-----END PGP SIGNATURE-----

--6FVk2V0LrGBjdKpm--
