Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC5F708852
	for <lists+dri-devel@lfdr.de>; Thu, 18 May 2023 21:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04BBC10E544;
	Thu, 18 May 2023 19:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A04910E544
 for <dri-devel@lists.freedesktop.org>; Thu, 18 May 2023 19:25:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2EB0460B71;
 Thu, 18 May 2023 19:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54358C433EF;
 Thu, 18 May 2023 19:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684437939;
 bh=Ey4oQzzAq2Xv5tRbfaLF7gcD0GoLd9dwY7x3rOsNRb8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hDCIEXIZSoz5QLJ9k7vqS3S3OSGN1ywQNRO66la1MxXr+zcWvWNXSWQ38pP9evaZo
 93Fqt2mgHotEMBmYG2Uc5uxiot6mBFiVSzAyrrEp264qZwAuzZF4LZG8c6k19E6LPs
 /gOHGzI75do6BeXh5QKYKhkdZmqAreDydYJ81acpGbinrWMgtQ2ki0IUiu0wEj51GC
 2ARXgBf1EXYMAoCD3m0kqyOPpXPCGDNXznOw1qFanlaGwBl1yO4t0VXS01r8qDNamf
 Vxc/PteKS1ERzZ01HKLuI8fZ0SwaNQ3+0weOWJv3UUJ1s4vAVq3Nxw7uMASaIMrQip
 XQWoZzffUmnxg==
Date: Thu, 18 May 2023 20:25:34 +0100
From: Conor Dooley <conor@kernel.org>
To: Paulo Pavacic <pavacic.p@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: panel: add panel-mipi-dsi-bringup
Message-ID: <20230518-viewpoint-haven-d2e4c3b5f305@spud>
References: <CAO9szn18KsR0c+U8EEY1=xnmsKMxy6SEArMUic0z=aYJDVwWCQ@mail.gmail.com>
 <023f6cf9-0f08-f27e-d203-5ff78faf110f@linaro.org>
 <CAO9szn1EsbuPSRrOW8CLqhp+QUcL=9NE93FAwsg2n3htd_aJTw@mail.gmail.com>
 <CAMty3ZCAP6CRsJWMUZZ6+hd5igX3NgyNfhdEv2FwuDtqj4iaaA@mail.gmail.com>
 <HB0TUR.1IPEEV2C5LMB1@gmail.com>
 <CAMty3ZCSUx-81m4SQcJZvUq3NyhzZbe8ow+LiV7iyUmVLCmNYQ@mail.gmail.com>
 <CAO9szn2A22KTzrCTX+24Y3goSberHpcGf-O-Czv3+_dX+pL+vQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="A8Lg/r5jOWbk2+NT"
Content-Disposition: inline
In-Reply-To: <CAO9szn2A22KTzrCTX+24Y3goSberHpcGf-O-Czv3+_dX+pL+vQ@mail.gmail.com>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, krzysztof.kozlowski+dt@linaro.org,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--A8Lg/r5jOWbk2+NT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 04:47:08PM +0200, Paulo Pavacic wrote:
> > So, the driver has to be panel-fannal-c3004.c and binding to be fannal,=
c3004.yaml.
>=20
> I believe I have covered this and all the other problems in following
> patch which I will submit as a V3 of the conversation in a patchset
> together with a driver:

Please do, that'd be great.

--A8Lg/r5jOWbk2+NT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGZ7rgAKCRB4tDGHoIJi
0nOIAQCTsXNhUb/HN3g3I+6LQLZaEACF0NvppF3NLbwC/Q4KqwD/Sh27dTJJsm6S
uLadNbb0zc52FvN+PQmmFhSH4eFhRgw=
=kXGS
-----END PGP SIGNATURE-----

--A8Lg/r5jOWbk2+NT--
