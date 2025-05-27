Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADA1AC49CC
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 10:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA95810E3BD;
	Tue, 27 May 2025 08:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="C2shsgDI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 134E110E3BD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 08:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1748332814; x=1748937614; i=deller@gmx.de;
 bh=vjznYVEdgRue6cSoVcvQqjS9rIOLtAEKjeh0EG/K6hk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=C2shsgDIrmNi2nhekzy2lbEUb1ho7epbXNhKSh39ns+zstontbCwNUmTRbQrlXa6
 bDPSNvPFpch9zJwE62Q+rsmfEszo4yhk0FEz25f3B7WCmydKRKSVZ/gMFb1BEv8ZB
 UNFPsc98hF9xx04TObLoUlNRbyckycHZ3hrq8zJaOqaPY/I9p+D36WuEQBE+YBkcF
 ecIcNjVqEqg/XimVOsq5UPA6GidiOCz+LZsjDJtuXhBOgWhh9U1smI2sMp18wy6t/
 uM1wtXuBb1OuDUuBWhYVuh0mAIXgbG89EQ+U+PxdHFg4BjKtM8EvtEUUI3KSvaGai
 o+v8PUkN8Uvm8ikD+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.173] ([109.250.63.171]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MPXhA-1uXUVA1RvW-00OhM5; Tue, 27
 May 2025 10:00:14 +0200
Message-ID: <2891af73-0e18-464b-9a91-c49f3cd847a3@gmx.de>
Date: Tue, 27 May 2025 10:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation : fb : sstfb.rst : Fixed spelling mistake.
To: rujra <braker.noob.kernel@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CAG+54DaA4ni5g26AFKGe76-AgFeMy4GUVopgMQukeaJ_bPWDRQ@mail.gmail.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <CAG+54DaA4ni5g26AFKGe76-AgFeMy4GUVopgMQukeaJ_bPWDRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HUhFpnJaEZ+Wf5o4XZDwOUL9yHiIbvNQGCxTESR9NLSe1rxrDGS
 cYpOEGbwyrfUf8nNTMefwh44FKV4vA2ds+ef/UjFfP8TN2OOCDNLwN6z0/PrXhMm3aGBJl8
 OasRDt0rmgBIzhyxnm2iWSh79ZXoc0Ds/RqP6QNSX51rl0ESQh7w6ZPXnEa+qbl+9osMAKC
 QHyJxf+a3Etrz9hRlCyKQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AY/6JfJL9tA=;FTaUz6xksXBSGcANxBO4v4Ud2O3
 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
 LEFCcBQk6n0Os=
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

On 5/19/25 16:38, rujra wrote:
> fixed document with spelling mistake
> changes made :
> 1. "tweeks" to "tweaks"
>=20
> Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>

applied to fbdev tree with small changes...

Thanks!
Helge

>   Documentation/fb/sstfb.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/fb/sstfb.rst b/Documentation/fb/sstfb.rst
> index 88d5a52b1..6cefa974a 100644
> --- a/Documentation/fb/sstfb.rst
> +++ b/Documentation/fb/sstfb.rst
> @@ -192,7 +192,7 @@ Todo
>   - Get rid of the previous paragraph.
>   - Buy more coffee.
>   - test/port to other arch.
> -- try to add panning using tweeks with front and back buffer .
> +- try to add panning using tweaks with front and back buffer .
>   - try to implement accel on voodoo2, this board can actually do a
>     lot in 2D even if it was sold as a 3D only board ...
>=20
> --
> 2.43.0

