Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCB21211AB
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 18:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FCD86E847;
	Mon, 16 Dec 2019 17:23:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7806E6E846;
 Mon, 16 Dec 2019 17:23:23 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id u2so134785wmc.3;
 Mon, 16 Dec 2019 09:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fDTU2xRE217quAURXeDNwr9rSajyW4k3C/7yXfGPe+s=;
 b=sfidfaoOonBYsPEQ7+Yk4Nqqk5o8buIX1DHlH4NTSQy4WRDJUbH0BBzt+sekdhTFh9
 kB2cE8lGStESzSffqxvt8cvjh1pxIHZOr5VCVGjrKxcYHGZKvSTGiE6hmmz0ZMyJvXlG
 WnjhJszvQJCMrpiTe1qdscTQvLMJJ/DyzMFW76xN2uVU31NE1wfCK5ZhT9R1bcIORIwB
 7KrvwiKkAZ5as0mWFC1qkKmrbLi41SsGCC6TKNxGBX1hUJW203+BqSBB7WTUiFx7kfBo
 nDMkybyPkAUBG/ZDZHPw6+2YnEDebxni4K1TfLcIuC/Z/XAqd1OGCN42Hsi/OZpx+fvF
 D/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fDTU2xRE217quAURXeDNwr9rSajyW4k3C/7yXfGPe+s=;
 b=URHtG7kq1cKzQTDTHgi8q1mpHy1IPJDBFJjygCNibkTXqfS9GOc/tUoOBKH32SMmOI
 pwGVV6+4anb8xJM3tZ3Yuxaj9gj+Z8xO4Kzmz9LPUngCRf0h1MBBSR5b4pkUeIQZpDqM
 C3TzlxQlVr+5qWwM2hmGaGqMtCEnHA4eDpmvIx6ZMZM/IVD4/wc/Ux1ItaGdv+J4kLn8
 Xl878YBsxdk9vEP2hrUyRmYJyy9N5i8VrpFx1cu1+CnRqKq7TCxcF6P/CAxSR9YWx9Kq
 ekWoa8iGSeCa8fBwBwVBdL1Y2YihqXVx07AoPufNTJXX4J/4YlYYtF7VrF1/v59NtUuV
 jjTw==
X-Gm-Message-State: APjAAAXkZPyBREoTVcPyIIXTCLwIIAmWcYmA1IFSeZ3v54xhJ6eM1WTN
 Bz42ibps3MDKqW6c+2DQYWSbol4mFcaIqGnwarQ=
X-Google-Smtp-Source: APXvYqyKn7CNJbEdAwxml/kqAeTfotXthtFz+vqMKeAUnh3lliy8DHrElyvvv+6C00K0MJHKh31oU9c9yKMx1jAZrjE=
X-Received: by 2002:a1c:6404:: with SMTP id y4mr55909wmb.143.1576517002064;
 Mon, 16 Dec 2019 09:23:22 -0800 (PST)
MIME-Version: 1.0
References: <1576314753-65777-1-git-send-email-zhengbin13@huawei.com>
 <ab4d3c43-a954-88b6-6c58-de836e03c4b7@amd.com>
In-Reply-To: <ab4d3c43-a954-88b6-6c58-de836e03c4b7@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Dec 2019 12:23:09 -0500
Message-ID: <CADnq5_Mkw2MMzinYbNzj_qvbMbnDsPA9jbaBY0aJJnKYvSLyKg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove unneeded semicolon
To: Harry Wentland <hwentlan@amd.com>
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>, zhengbin <zhengbin13@huawei.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 9:32 AM Harry Wentland <hwentlan@amd.com> wrote:
>
> On 2019-12-14 4:12 a.m., zhengbin wrote:
> > Fixes coccicheck warning:
> >
> > drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c:412:90-91: Unneeded semicolon
> >
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: zhengbin <zhengbin13@huawei.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>

Applied.  Thanks!

Alex

> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
> > index de51ef1..a1b7e76 100644
> > --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
> > +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn21/rn_clk_mgr.c
> > @@ -409,7 +409,7 @@ void build_watermark_ranges(struct clk_bw_params *bw_params, struct pp_smu_wm_ra
> >                       continue;
> >
> >               ranges->reader_wm_sets[num_valid_sets].wm_inst = bw_params->wm_table.entries[i].wm_inst;
> > -             ranges->reader_wm_sets[num_valid_sets].wm_type = bw_params->wm_table.entries[i].wm_type;;
> > +             ranges->reader_wm_sets[num_valid_sets].wm_type = bw_params->wm_table.entries[i].wm_type;
> >               /* We will not select WM based on dcfclk, so leave it as unconstrained */
> >               ranges->reader_wm_sets[num_valid_sets].min_drain_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MIN;
> >               ranges->reader_wm_sets[num_valid_sets].max_drain_clk_mhz = PP_SMU_WM_SET_RANGE_CLK_UNCONSTRAINED_MAX;
> > --
> > 2.7.4
> >
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
