Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4541BEEDB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 06:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB956EA80;
	Thu, 30 Apr 2020 04:01:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E0A6EA80;
 Thu, 30 Apr 2020 04:01:04 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id a7so2479290ybs.4;
 Wed, 29 Apr 2020 21:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uigr/Bk3pctYSK4o6DhYhTgwopWjtqRs7LnV/grgN5Y=;
 b=HlDSU8FWDhsYKPb5rwVsizFvS0q7cSdPJi1n92iA/wCG7sSfUBU2q4+Gba+vBukyz1
 5AcwvpIE3pCO81NypD9yqFzt7k2reoGPoGd9VmFZcUhxmioRZqCH2vmwxwgI+EQbDZxZ
 T/kn1ukQ8MxQFvoFumY4DgOVM94yR11F92ZGgUE1r+0BB4TIMrKcHIQz6yT0agLOuOZI
 BSfUZ5J1JOrZo5xXTNi+ZNc3xIM/a4K11SBPao6N1rfPmS5UFIL8SifVl2atYw6WGZdH
 XSDvD13TGin2Z0pELvo1Dh7YsYiOHT0ZTfe23XEMgYZA7Ea9Rak2+hzhafFmh68qn3/T
 X26A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uigr/Bk3pctYSK4o6DhYhTgwopWjtqRs7LnV/grgN5Y=;
 b=kMjR+6VU5f3GYNrm1KtuH3+//YSjJ190GSmXbxrO/HVUMs2uzqc9YOzCcl7ZrSEUDg
 xX1COnLZMJCBOlOb9mJyRvX3v58K8Qu38GDyfj86WbLz3dThRbbJnfIqYs1ZtFs8rat3
 zjHA8pCAI3DxhEthnv1RJZgul0ZTfj1hU9YiXu8F9xjXwle2Rl5cbE5VryPY9iNRyxxh
 n3EBlN8VMoRlmpR/SvU1014GX+4K1xOibkU+IsihINmwMxVhAtsMVFSXzRuUsUjXj/LO
 o/uTrT8Y76S8/9xZ/2bw8Hxy0PazCA5Kblw1rUHhrISoqC29qQWssyzrG9oG13LOuVsp
 oo+Q==
X-Gm-Message-State: AGi0Pubug1O9GP7ixPmWx89WlD+3rXg0vWQsxqQ4SY/t0KoqLjdahlgm
 ej9EXVUuQVBZCBT22IAnymIR1l1YQpEP4E+c9ZuyZdZe
X-Google-Smtp-Source: APiQypI9ba6qHe3Ig0YTY62gqUCQsREqs/dCO0PphyN68mxloPgpa8vB4qbheHh55vuRJHLEqys/+MA6c+26curgDho=
X-Received: by 2002:a25:6b46:: with SMTP id o6mr2462578ybm.147.1588219263490; 
 Wed, 29 Apr 2020 21:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200424073601.143549-1-zhengbin13@huawei.com>
In-Reply-To: <20200424073601.143549-1-zhengbin13@huawei.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 30 Apr 2020 14:00:52 +1000
Message-ID: <CACAvsv4P8UWPTeRqTX1=3utdaPud_H01ANdTb567WiFLJB84pA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau/mmu: Remove unneeded semicolon
To: Zheng Bin <zhengbin13@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks!

On Fri, 24 Apr 2020 at 17:29, Zheng Bin <zhengbin13@huawei.com> wrote:
>
> Fixes coccicheck warning:
>
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h:307:2-3: Unneeded semicolon
> drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c:583:2-3: Unneeded semicolon
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Bin <zhengbin13@huawei.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c | 2 +-
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> index 41640e0584ac..199f94e15c5f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -580,7 +580,7 @@ nvkm_vmm_iter(struct nvkm_vmm *vmm, const struct nvkm_vmm_page *page,
>                                 it.pte[it.lvl]++;
>                         }
>                 }
> -       };
> +       }
>
>         nvkm_vmm_flush(&it);
>         return ~0ULL;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> index 5e55ecbd8005..d3f8f916d0db 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> @@ -304,7 +304,7 @@ int tu102_vmm_new(struct nvkm_mmu *, bool, u64, u64, void *, u32,
>                 FILL(VMM, PT, PTEI, _ptes, MAP, _addr);                        \
>                 PTEI += _ptes;                                                 \
>                 PTEN -= _ptes;                                                 \
> -       };                                                                     \
> +       }                                                                      \
>         nvkm_done((PT)->memory);                                               \
>  } while(0)
>
> --
> 2.26.0.106.g9fadedd
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
