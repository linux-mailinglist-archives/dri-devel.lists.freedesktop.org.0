Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A814804FF7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 11:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF37110E4CC;
	Tue,  5 Dec 2023 10:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199EF10E4CC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 10:13:33 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1rASOC-0008F0-3E; Tue, 05 Dec 2023 11:10:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rASO5-00Diid-K1; Tue, 05 Dec 2023 11:10:45 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1rASO5-00Ee1U-8q; Tue, 05 Dec 2023 11:10:45 +0100
Date: Tue, 5 Dec 2023 11:10:45 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [DO NOT MERGE v5 14/37] clk: Compatible with narrow registers
Message-ID: <20231205101045.tl43oexzbtelcazr@pengutronix.de>
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <e27ae1458bd2caabef5423e4ed79fe49813e13b1.1701768028.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="apda54f5ixgehnv6"
Content-Disposition: inline
In-Reply-To: <e27ae1458bd2caabef5423e4ed79fe49813e13b1.1701768028.git.ysato@users.sourceforge.jp>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Bin Meng <bmeng@tinylab.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pci@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--apda54f5ixgehnv6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Dec 05, 2023 at 06:45:33PM +0900, Yoshinori Sato wrote:
> @@ -675,13 +681,17 @@ struct clk_div_table {
>   * CLK_DIVIDER_BIG_ENDIAN - By default little endian register accesses a=
re used
>   *	for the divider register.  Setting this flag makes the register acces=
ses
>   *	big endian.
> + * CLK_DIVIDER_REG_8BIT - by default 32bit register accesses are used for
> + *	the gate register.  Setting this flag makes the register accesses 8bi=
t.
> + * CLK_DIVIDER_REG_16BIT - by default 32bit register accesses are used f=
or
> + *	the gate register.  Setting this flag makes the register accesses 16b=
it.
>   */
>  struct clk_divider {
>  	struct clk_hw	hw;
>  	void __iomem	*reg;
>  	u8		shift;
>  	u8		width;
> -	u8		flags;
> +	u32		flags;
>  	const struct clk_div_table	*table;
>  	spinlock_t	*lock;
>  };

I wonder why .flags was made bigger here. The two new flag values would
still fit into the u8, right?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--apda54f5ixgehnv6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVu9yQACgkQj4D7WH0S
/k5q9gf/eD5pj/8ERjn9GwHl1uStF4vOGLa/uZ8iRNZpMi1Kvits+6Yri1aT0IG9
cVW6KuG3Gmw0GpkFkppfZNMPa9C1NzLJhD5aFtSoSfIkAVA8JNVweDRBV9xaiLxc
eI1t6ze8m74Pxtm/kTa3kPnm+x6Oe1SRZwF+0D5yEMKwGz4GEhFkGNHK3TI+nYm9
3gfZcJAeydHL0ORJU8XS4Plj7jQ3WE9a+zxy4Odn3V+KS/2Ck2Kqp6kzJSH5CAVn
YxeDRNGxrm3AY8y4d2jI/vBTB+4VwJofVczJ1y5ksyistGiyWT59kYjhDLxo87th
4lS0y2d0FfwkAxslCSxm22vlDDZ+Sw==
=TMZa
-----END PGP SIGNATURE-----

--apda54f5ixgehnv6--
