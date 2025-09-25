Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A71EBA2B17
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 09:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1FA10E274;
	Fri, 26 Sep 2025 07:24:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF6EC10E94A;
 Thu, 25 Sep 2025 14:01:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9D93E4442D;
 Thu, 25 Sep 2025 14:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED797C4CEF0;
 Thu, 25 Sep 2025 14:01:13 +0000 (UTC)
Date: Thu, 25 Sep 2025 15:01:11 +0100
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
Message-ID: <111409f1-33cd-4cd1-b3fd-e38402a82c9f@sirena.org.uk>
References: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JGFFBrCHdqJdDJfa"
Content-Disposition: inline
In-Reply-To: <20250925-core-cstr-cstrings-v2-0-78e0aaace1cd@gmail.com>
X-Cookie: Shipping not included.
X-Mailman-Approved-At: Fri, 26 Sep 2025 07:24:26 +0000
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


--JGFFBrCHdqJdDJfa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 09:53:48AM -0400, Tamir Duberstein wrote:
> This series depends on step 3[0].
>=20
> Subsystem maintainers: I would appreciate your `Acked-by`s so that this
> can be taken through Miguel's tree (where the previous series must go).

Given that we're almost at the merge window isn't it likely that these
will get applied once the current rust tree is in mainline?

--JGFFBrCHdqJdDJfa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjVSyYACgkQJNaLcl1U
h9C17Qf/YgEwpltWEUIGgUaSbpdA0l3EOpF8ChVfeUiB5k9dCOndChZptDoIsg85
PB++cSfnFQkgzNH3wYTfwtUmYyk2V+NSPaWGooIfOVBrnzE60Vp/buyAVu2FMFa+
eCzJ5UP9/CxqrpD00TxXBCEuTh1ejksRqsawy2e47xND1j1+WdeUp6QSVg4O+gyv
f/AsLvo8yACTbYWgqONdC3AWxUlaCHmuZLXaNbtmaKsZaOeeE2nPDfNGK0XA8dFm
OW+b38cPKCdFYtkOoP/uQGu9lyKqrwDfJNRuO1ca8Rv4Ey8eHwQ2EmMCBs76yorL
+4uyntn5a+EHzOE3s+95LwAANHWJXA==
=8lId
-----END PGP SIGNATURE-----

--JGFFBrCHdqJdDJfa--
