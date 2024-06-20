Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA0F910B9C
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 18:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0ACA10EAEA;
	Thu, 20 Jun 2024 16:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sL1Zmpak";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB57410EAEA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 16:14:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B06DECE2741;
 Thu, 20 Jun 2024 16:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71A0EC2BD10;
 Thu, 20 Jun 2024 16:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718900059;
 bh=+GHT9WcvwhnXq3uv4PeG/J2phcFuK0s3zZGAxE9Vr94=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sL1Zmpak4E6ksK9u+PVo5VdVvcL+kvWyI8ZQX46xQpOe6Xj/v/RqajdHhXoBlKJkF
 qhLB8HB641YNFZpDspRhNRiHPITXDqpNsDMIzE9VXAF5rHa4cuV6t6zFAX4UdAng3L
 DIwe6PgCD/V+PohEOjfcntpY7b3Q7K83LgVtTnMIjZqdXxgpfmU8Wt8tt0C/evsUvs
 TaeySm/znVYAg0k3/1iTkaXClkLqDU2GpOl+o26hMvFKKSLIhMTMHZ2JaKoc4UxzSj
 SIPZqV1xTJ8CbvLuEo1Dd2oZl3yRRbPNDhBbqjhzUk0iJvKW4zkaMX93RbVpw4L37b
 fGyPyCy4hGmsg==
Date: Thu, 20 Jun 2024 17:14:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: dmitry.torokhov@gmail.com, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jikos@kernel.org, benjamin.tissoires@redhat.co, dianders@google.com,
 hsinyi@google.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: display: panel: Add compatible for
 kingdisplay-kd101ne3
Message-ID: <20240620-shiny-germless-d5b8d532c9d1@spud>
References: <20240620080509.18504-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240620080509.18504-3-lvzhaoxiong@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aDlbeZ9BUzsTHd9G"
Content-Disposition: inline
In-Reply-To: <20240620080509.18504-3-lvzhaoxiong@huaqin.corp-partner.google.com>
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


--aDlbeZ9BUzsTHd9G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 04:05:07PM +0800, Zhaoxiong Lv wrote:
> The kingdisplay-kd101ne3 is a 10.1" WXGA TFT-LCD panel with
> jadard-jd9365da controller. Hence, we add a new compatible
> with panel specific config.
>=20
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--aDlbeZ9BUzsTHd9G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnRVVwAKCRB4tDGHoIJi
0ncSAP43WLQQ6LFeUx/1Ug5lQcZ4fs4MmDPdXIqCNU8WuIBgmAEAxXbKXm2s74+Q
2TWp6pYecg8Oo+td+P35lDWuiEil0wo=
=6avv
-----END PGP SIGNATURE-----

--aDlbeZ9BUzsTHd9G--
