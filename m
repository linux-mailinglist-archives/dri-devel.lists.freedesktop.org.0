Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F667C87D9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 16:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A8810E0DA;
	Fri, 13 Oct 2023 14:28:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C9410E0DA
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:28:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id DC719B82B42
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41177C433CB
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697207313;
 bh=2eOh7NpgkrCXozbLScffQR9yHVXlQrz4c3vxHLHzWJU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dsgOR4jl9woOYSykt2osUFJgbGV315sl9p9+2ldVZ3jNFrEkyAz//LiVfigMkyoh3
 iM4x0i5wZEn0uenKB0wI13o9EsbBLkG67h6Zem/19PoO3ikCO+S0/T1EOUHK5K/6/w
 RJ27pPZbD/PAiVL5+Etjd2zZpcbWMCSLSWxyIduxa4gWKWit9PVa6wIqJRKgnzP7qf
 BiV1ekceUSAjE9L9SagCvG11CLf5r9gGArgOSg/swmLKtqUlbfCwsR959b0Hxlr3px
 TwLp0V82dA/PKfXWvArs3gVBQ9T1xCt8DS9v6wlruxh07s2dk4BTS7cP16T4RobBNH
 ZlBtS8FN2Pssg==
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-27d18475ed4so1758415a91.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 07:28:33 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxp6IxoFX8DZH5tHaLy/vJwXQhKNFcct+hEXOktEnHnasP71TUs
 svQI7MVTZzbwJxgY9XnoJ94tTk8epn6otftOXTvYQw==
X-Google-Smtp-Source: AGHT+IHQjGfDxvX9Pi0OWF+lgvtAJbPW1esyglGuMNkYxZT5nUfF5MzjBZKXL1JLGgBCKafJco2uyk3xYxmgcoVHqb0=
X-Received: by 2002:a17:90a:319:b0:27d:3a2a:1e2c with SMTP id
 25-20020a17090a031900b0027d3a2a1e2cmr1730163pje.15.1697207312834; Fri, 13 Oct
 2023 07:28:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230921104751.56544-1-ian.ray@ge.com>
 <20230921104751.56544-2-ian.ray@ge.com>
In-Reply-To: <20230921104751.56544-2-ian.ray@ge.com>
From: Robert Foss <rfoss@kernel.org>
Date: Fri, 13 Oct 2023 16:28:21 +0200
X-Gmail-Original-Message-ID: <CAN6tsi6Ub0bqxZiWa1D=EPjJvDXQAPmovL-LkRKvjnAMX7N7Pg@mail.gmail.com>
Message-ID: <CAN6tsi6Ub0bqxZiWa1D=EPjJvDXQAPmovL-LkRKvjnAMX7N7Pg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] MAINTAINERS: Update entry for
 megachips-stdpxxxx-ge-b850v3-fw
To: Ian Ray <ian.ray@ge.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: neil.armstrong@linaro.org, martyn.welch@collabora.co.uk, jonas@kwiboo.se,
 dri-devel@lists.freedesktop.org, peter.senna@gmail.com,
 jernej.skrabec@gmail.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 21, 2023 at 12:48=E2=80=AFPM Ian Ray <ian.ray@ge.com> wrote:
>
> Replace Martin, who has left GE.
>
> Signed-off-by: Ian Ray <ian.ray@ge.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bf0f54c..31bb835 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13524,7 +13524,7 @@ F:      drivers/usb/mtu3/
>
>  MEGACHIPS STDPXXXX-GE-B850V3-FW LVDS/DP++ BRIDGES
>  M:     Peter Senna Tschudin <peter.senna@gmail.com>
> -M:     Martin Donnelly <martin.donnelly@ge.com>
> +M:     Ian Ray <ian.ray@ge.com>
>  M:     Martyn Welch <martyn.welch@collabora.co.uk>
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/display/bridge/megachips-stdpxx=
xx-ge-b850v3-fw.txt
> --
> 2.10.1
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
