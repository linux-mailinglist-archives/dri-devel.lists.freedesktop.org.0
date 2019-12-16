Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9EC1211B8
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 18:28:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 860FE6E84B;
	Mon, 16 Dec 2019 17:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F9D6E848;
 Mon, 16 Dec 2019 17:28:33 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j42so4114537wrj.12;
 Mon, 16 Dec 2019 09:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VonmFEbKNIVFPj71qKaZLVkIiUnrSExcTNphleb6tzs=;
 b=g26j1sDFBrj6tng2kXFyfBWF2eCHL1W0tjsnLCuQKZRepEGuD5jKsIat+LCAeSsizR
 +RW167u9LDyUJ6Dx3Gn7sDkx7ikf5Ez7efSljTwwK89m3gtQ0aq8OrCZt4ucaKm4KssQ
 zhz/htRFjwvCrQtt25ViFNQgTQXpkjflX4IosPaypjnD37fevryXKwnNDTXMZVGc+y7F
 IvCOedqKSH5Sm0H9AayWi48xTQ/f9e8g2D0Lri1bZ7j+LYLsjWP3iQ+EEtvgn89DHC90
 JTd6R/HzCSzRwCfkqDyV3HV2dLvzNJqHbhEhnbd9mxb04iMegJcQX73bivd8edSpe1+Q
 rKaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VonmFEbKNIVFPj71qKaZLVkIiUnrSExcTNphleb6tzs=;
 b=G39aZkbe5nb04ZSYVPCh5EplK4xeWuJ1KqIl+KKEWc9RLHOzAT9sFZWKC1jkwq2Ext
 pKdfffXXZW5+bgUaMbroox4VVkzdCaY26eqknSNH+aX6obDlwm9r0m3TYfGY4VCJtIaz
 T3UOr0MxZp+H15vR0TbCwRhjTe+xXbFYVCXlv8YCXlHhdonwu8WZDKY7uele+qjzWMR6
 FGVpB5u3tBWTVH3P51nxZKUajqiHPLXYs40vUdJnh3a22LCA2AH8i3UdDNnDDFCT86ii
 pPEnHM77m76dg57H9nOxAfSWHUPfN0+/+1hYGx/HxlCM5GljWbUu6ZmLLGy0KfG7nyb5
 QTxg==
X-Gm-Message-State: APjAAAUNd+Ci0GZXFM5cPlQ8E/gTy9BQtin/Hj7apO4acECCyYUxWQHx
 /gUdLRDQcabwh59RYhN9Ty1ZPt880muhPFjQ05M=
X-Google-Smtp-Source: APXvYqxgPEcG+FNGAptMFTRIyvh+cC7Usx8WVqWvF1kvtome8r/1jUFjkb4DZrpO7UGojrFXnXLjOwPNxkHhZOdSigo=
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr31872928wrn.50.1576517311984; 
 Mon, 16 Dec 2019 09:28:31 -0800 (PST)
MIME-Version: 1.0
References: <1576314144-27602-1-git-send-email-zhengbin13@huawei.com>
In-Reply-To: <1576314144-27602-1-git-send-email-zhengbin13@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Dec 2019 12:28:20 -0500
Message-ID: <CADnq5_P3jcpT2iBvDZva0C3iPCvT2zVAQ7gL3wA5fXue0kKq_Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] drm/amdgpu: Remove unneeded semicolon
To: zhengbin <zhengbin13@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Sat, Dec 14, 2019 at 9:44 AM zhengbin <zhengbin13@huawei.com> wrote:
>
> zhengbin (3):
>   drm/amdgpu: Remove unneeded semicolon in amdgpu_pmu.c
>   drm/amdgpu: Remove unneeded semicolon in gfx_v10_0.c
>   drm/amdgpu: Remove unneeded semicolon in amdgpu_ras.c
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_pmu.c | 8 ++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 2 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c  | 2 +-
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
