Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A727ED1DC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 21:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D90B10E1B3;
	Wed, 15 Nov 2023 20:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE7310E1B4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 20:14:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 11A21CE1DD1;
 Wed, 15 Nov 2023 20:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F14C433C8;
 Wed, 15 Nov 2023 20:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700079278;
 bh=u27jYiyCnPvX7BwcogXqTwm0JCokegPD0Pe+zFt7/vk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TiQsJcibVMrhAUxdRs4u55T1ZRdXUaqXl0B5FwM1xxy95CP56AwkQ1rDOe8a9oRoM
 Z8/1VADpjkogA5+7sakttqxM+FIdPYZCb6phOXReJyup0qXLXDxcDlBED2qrZ9pEK/
 5d23ZF8mirTogRa0OaIJ6zSozfBveBNkof79iV0xhe4z7yoIHnXwn6mqxh1h426RzR
 5BDgd7OCfpaenn5yZ96T8LtORT8jEzmRim8o1D82D5BBkWn0IBuHnMgWvXhB4dr07X
 VKcfkO78iZsKEchmMDJOT0SGiuzm2EaZdxuf33hGEk96KPL2GK8EUKga0NP+ACePHB
 q4fkFIRbfc2mw==
Date: Wed, 15 Nov 2023 20:14:32 +0000
From: Conor Dooley <conor@kernel.org>
To: Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH v6 1/2] dt-bindings: backlight: mp3309c: remove two
 required properties
Message-ID: <20231115-showdown-blame-06a9acb63506@squawk>
References: <20231115152902.851715-1-f.suligoi@asem.it>
 <20231115152902.851715-2-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7YInnrzDKNO+YsB+"
Content-Disposition: inline
In-Reply-To: <20231115152902.851715-2-f.suligoi@asem.it>
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7YInnrzDKNO+YsB+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 15, 2023 at 04:29:01PM +0100, Flavio Suligoi wrote:
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>

You omitted my ack that I gave on the previous version.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--7YInnrzDKNO+YsB+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVUmpQAKCRB4tDGHoIJi
0qqQAP48sZ0PpimqIgeXVDtIsAnRBgLRK6J12gcofe0rmm2dTQEA6AsQB7AwImc8
T8U4C7CkANMlEQvcOu1fB5Bl5KkzKgw=
=Z3fk
-----END PGP SIGNATURE-----

--7YInnrzDKNO+YsB+--
