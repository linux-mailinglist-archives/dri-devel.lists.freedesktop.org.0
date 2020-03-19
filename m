Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B6418AB11
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 04:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6101D6E987;
	Thu, 19 Mar 2020 03:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983586E981;
 Thu, 19 Mar 2020 03:17:32 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id b2so888919wrj.10;
 Wed, 18 Mar 2020 20:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lxbpdb/zHX34RAGKQr0FlEpIyzFdli6m2UUnuAUxQDY=;
 b=XUTLFINDSRQHwZWmu8wzz+tq6somhCq9OkURijfnUStRuDmZjtG6qmgCU5yE6NOQCG
 /OASdUgIZBJaL975A+yJGrLQNkGp1dpXb+gjZYAf8g8LvFQd9IRMDpl+hfe5RKwIT4Yw
 UKGToP7vm/usFR3tZ2Tn+h15it/OJh6ma57w65Cq64+TVPDLv6xQ8ipk4yhHJgKBnZQK
 z7pi66eBgkwc80zfgkbMJAMzOfuxNxS5DY3Q6bw+2b9Jo4qwatEXnFbZVMZEwappc5hZ
 X0iaffo7Wmi7ybUTsfDdQmC5Xj0+BX1r37gJXFq4HJWuIaAenRUOEARlvBPB2vqQ1/A2
 A3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lxbpdb/zHX34RAGKQr0FlEpIyzFdli6m2UUnuAUxQDY=;
 b=SZ8ySvJ9yY0o2huw8dbIieYBxNkdLIZcOLhVNemc64cORiKoaSrpyldttPxd8GXgbT
 xphktWD9BXtGUSWq6g/MlW+7LuX8b6fnFBXHgW/IvtX88lpSoODQUWO9dMd7U3kit/HL
 Tc4oIRZzMYwbzWSO3b1gwDqxhd2gnF2DQHejzCfEKuNd2N1rnmkNp7l+2fbau8m2O5A2
 rwDMbviDp6hvfm2KqmGQ6+E8G+qZiiSR7H1j9ICPWhl8VrDJ0DCI/Gq8nxhFS14640xM
 x6uy4t2527K4bosZYEJS6W1nHO/rzzD2E+bvfHTgwA6r9ylMKV+I18XsWzzG7GdKyVfD
 dehA==
X-Gm-Message-State: ANhLgQ107cqAVmhJcC9O3UDYys02Zk19gWymEO02ODG9Nnh8e747c1hi
 JyDRL42Hj8zsu+0aOXVCrkQD9xd5QgZ4hgNNdb99ew==
X-Google-Smtp-Source: ADFU+vutC3ZCjbJI/gjisXmnRkhteTf44mLqpO5IMSlmp67BHMdFQBf68wH3gJOGERG4sXcRZyas/tvdVLyOEPSgMUc=
X-Received: by 2002:adf:b35e:: with SMTP id k30mr1227716wrd.362.1584587851267; 
 Wed, 18 Mar 2020 20:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200317114748.388420-1-colin.king@canonical.com>
 <CADnq5_NbdBhz+TQ0Ldng8fLjnRmDiuKDhTrqsC0WDt8-0Vq41g@mail.gmail.com>
In-Reply-To: <CADnq5_NbdBhz+TQ0Ldng8fLjnRmDiuKDhTrqsC0WDt8-0Vq41g@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Mar 2020 23:17:20 -0400
Message-ID: <CADnq5_MNOCRxe=S2kp7c3miGJ11L35qFhz4S5PDPVX2NoODv9A@mail.gmail.com>
Subject: Re: [PATCH][next] drm: amd: fix spelling mistake "shoudn't" ->
 "shouldn't"
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 11:10 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> On Tue, Mar 17, 2020 at 7:47 AM Colin King <colin.king@canonical.com> wrote:
> >
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > There are spelling mistakes in pr_err messages and a comment. Fix these.
> >
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> The relevant code was recently dropped so no longer applies.

Sorry.  was looking at the wrong branch.  Applied.

Thanks!

Alex

>
> Thanks!
>
> Alex
>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c       | 2 +-
> >  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c        | 2 +-
> >  drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > index d1cdcb404f7c..4bdf425ca6d8 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> > @@ -246,7 +246,7 @@ static void gfx_v10_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v)
> >         grbm_idx = adev->reg_offset[GC_HWIP][0][mmGRBM_GFX_INDEX_BASE_IDX] + mmGRBM_GFX_INDEX;
> >
> >         if (amdgpu_sriov_runtime(adev)) {
> > -               pr_err("shoudn't call rlcg write register during runtime\n");
> > +               pr_err("shouldn't call rlcg write register during runtime\n");
> >                 return;
> >         }
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > index 7bc2486167e7..2dd40f23ce83 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> > @@ -747,7 +747,7 @@ void gfx_v9_0_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v)
> >         grbm_idx = adev->reg_offset[GC_HWIP][0][mmGRBM_GFX_INDEX_BASE_IDX] + mmGRBM_GFX_INDEX;
> >
> >         if (amdgpu_sriov_runtime(adev)) {
> > -               pr_err("shoudn't call rlcg write register during runtime\n");
> > +               pr_err("shouldn't call rlcg write register during runtime\n");
> >                 return;
> >         }
> >
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
> > index bb77b8890e77..78714f9a8b11 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
> > @@ -316,7 +316,7 @@ static void kfd_init_apertures_vi(struct kfd_process_device *pdd, uint8_t id)
> >  {
> >         /*
> >          * node id couldn't be 0 - the three MSB bits of
> > -        * aperture shoudn't be 0
> > +        * aperture shouldn't be 0
> >          */
> >         pdd->lds_base = MAKE_LDS_APP_BASE_VI();
> >         pdd->lds_limit = MAKE_LDS_APP_LIMIT(pdd->lds_base);
> > --
> > 2.25.1
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
