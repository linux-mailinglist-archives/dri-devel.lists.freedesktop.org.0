Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 639D967DC58
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 03:52:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D4B10E0E6;
	Fri, 27 Jan 2023 02:52:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8708C10E0E6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 02:52:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A36FA619E8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 02:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06EFCC433A4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jan 2023 02:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674787949;
 bh=XmZzmR0H0odzZa8z+aZHxpi+uFsfehvEV4nWc6PcC00=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eo1FVATEqdfJvfJZte/joq1pAcX0U8hjZirWywMNQZxEJducD3X9WqLsXD4HJsfdj
 LD53lb34LZM9SgFT5t8ZLqJo7P8eepC58YF+wJqauy8qAuyEOYeXmb1iWOaswC+f3A
 lJyXN0Q4cGx1LxPkmYZSSdcASUqRKAFifFv793zJSP0AsJ/96IJdm0AxGcdOYHLGHJ
 ym+2zKZhz32VEpKNTo+g7wRjXodyc6LooXiI/tQcCTAKX7lCa+J/1rdrDIL1k5hW5u
 3sINUC/oBAyqy0TsVs+XOCnbn9MZISVWGzfYPyHmGok9N6rhRof9VzXwTIi6LNtZfm
 vPjHynsH/+Nnw==
Received: by mail-lf1-f42.google.com with SMTP id a11so6194770lfg.0
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 18:52:28 -0800 (PST)
X-Gm-Message-State: AFqh2kpEFsBXXlIH6YLC8pANY25ttw5+aGEj8J60WtkObDY899PdWpCl
 VWDFESoVZufg+HM1fwqwqDzhOfb33Ido8cg9IA==
X-Google-Smtp-Source: AMrXdXuUHO8hzB79znCWY5z5W+kP+XGUd9qQcOVFLEto3iBwYVy74HhXFjPnd5hXwwIRJ9E6HcUdt0DBWBdYu5B/NjE=
X-Received: by 2002:a05:6512:3f0c:b0:4b5:2aed:39be with SMTP id
 y12-20020a0565123f0c00b004b52aed39bemr4431185lfa.195.1674787946999; Thu, 26
 Jan 2023 18:52:26 -0800 (PST)
MIME-Version: 1.0
References: <Y8LNIt97qxLk8e70@ubun2204.myguest.virtualbox.org>
In-Reply-To: <Y8LNIt97qxLk8e70@ubun2204.myguest.virtualbox.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 27 Jan 2023 10:52:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY__4hW_MKnL5PxES+Z_VYTM1JXPgNCi2TW=WAb7Ri9yHLw@mail.gmail.com>
Message-ID: <CAAOTY__4hW_MKnL5PxES+Z_VYTM1JXPgNCi2TW=WAb7Ri9yHLw@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: dp: Remove extra semicolon
To: Deepak R Varma <drv@mailo.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Deepak:

Deepak R Varma <drv@mailo.com> =E6=96=BC 2023=E5=B9=B41=E6=9C=8814=E6=97=A5=
 =E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8811:41=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Remove unnecessary semicolon at the end of switch block closing brace.
> Issue identified using semicolon Coccinelle semantic patch.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang

>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 9d085c05c49c..9da58ac5a8b8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1693,7 +1693,7 @@ static int mtk_dp_training(struct mtk_dp *mtk_dp)
>                                 break;
>                         default:
>                                 return -EINVAL;
> -                       };
> +                       }
>                         continue;
>                 }
>
> --
> 2.34.1
>
>
>
