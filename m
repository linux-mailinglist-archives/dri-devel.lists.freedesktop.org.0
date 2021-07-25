Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0773D508E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 01:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A5256E34B;
	Sun, 25 Jul 2021 23:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27E526E34B
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 23:06:19 +0000 (UTC)
Date: Mon, 26 Jul 2021 00:06:07 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 1/3] dt-bindings: Add QiShenglong vendor prefix
To: Artjom Vejsel <akawolf0@gmail.com>
Message-Id: <7IPTWQ.3Z1HNE2ZJG041@crapouillou.net>
In-Reply-To: <20210725221527.1771892-2-akawolf0@gmail.com>
References: <20210725221527.1771892-1-akawolf0@gmail.com>
 <20210725221527.1771892-2-akawolf0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, thierry.reding@gmail.com,
 sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Artjom,

Le lun., juil. 26 2021 at 01:15:25 +0300, Artjom Vejsel=20
<akawolf0@gmail.com> a =E9crit :
> Add vendor prefix for Shenzhen QiShenglong Industrialist Co., Ltd.
> QiShenglong is a Chinese manufacturer of handheld gaming consoles,=20
> most of
> which run (very old) versions of Linux.
> QiShenglong is known as Hamy.
>=20
> Signed-off-by: Artjom Vejsel <akawolf0@gmail.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml=20
> b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index b868cefc7c55..1d45a2d7a7bb 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -926,6 +926,8 @@ patternProperties:
>      description: Chengdu Kaixuan Information Technology Co., Ltd.
>    "^qiaodian,.*":
>      description: QiaoDian XianShi Corporation
> +  "^qishenglong,.*":
> +    description: Shenzhen QiShenglong Industrialist Co., Ltd.
>    "^qnap,.*":
>      description: QNAP Systems, Inc.
>    "^radxa,.*":
> --
> 2.32.0
>=20


