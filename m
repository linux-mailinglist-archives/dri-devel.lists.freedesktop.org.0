Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6B33A9EC5
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 17:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A183895E7;
	Wed, 16 Jun 2021 15:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F6289C29
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 15:16:29 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id 5so2964522qkc.8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 08:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+nhKlZUvmaLvzRtebioASnVTBODgb1PiICRR5qFSU64=;
 b=F3S+cAhJVu3R7wHPGAV+lzkW559ATZ5NmtSDV08Utq+GVIbHhwKkqhUV1gzHD1N+3l
 hCj4APJEpLvwNfq1p9M8HtwSC4DivyUzJyXqoSn0qjA9iY4ShXE0JfZIWXY7GEsilrUt
 oNhwwcAuOrkZF/udSMP10+OwG0eqvQLN8O/01sn/tZKyZeFWFfpwxzEFwpDWzJMT1Wy8
 XbtjtvbmGSyxKejUDwamDEupqQNjsjXfJQWxUn/pT1PmarDUUp9/SgzSTtj/gURc4Qb/
 M52C/lPIupUftsfrZharTRhqKyavTIPZ1rK22kObNRMu70WUo74H5K0sEPOT6Esyzm1d
 ZIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+nhKlZUvmaLvzRtebioASnVTBODgb1PiICRR5qFSU64=;
 b=Tt7HN7TSHvFOQBeMhi6c6pTfQbKvPTB0t3esGy82zcVXTBPlFAXi8G0KWK4Xx+SNWg
 xbNGyDHCOakvAF4SwxJTnl4d8gVqU/JB+Ntr/PCs3Q9XhrQ6ssLA/QXplYi4kJoHlac9
 bP82bpG6D0WOaAtf+CYKqOvKdi0jsa80hzmBRRJHHG9eyHOsRL7U9PcPIciTxyVKGy7U
 aAfirzTPIhp8wI39oYhAPXPNhChFDmkh+n6rkzHcpzMPWkHUB7hxYiz+UeWqAPJT/Ohd
 0+m3qUkhnq7qacEyacInUufLnxaZKTJgy9t5CE8jG8YO0N570qQXXiOT/nUVi09AYMvo
 lKEQ==
X-Gm-Message-State: AOAM533O/HbxZtxRHGPNN48vudThAk8UHXoUmsbtVbBztDPvqrKthfVG
 5Y/TssQuKLeVPQvJlruqRT4CYk2mXyEVoRUqB0lr1Sh0TqGZ0wfX
X-Google-Smtp-Source: ABdhPJyLAVzG8VYbOVPOqAv1B8fdPgK4gHbuoEol8yn536Sb/mSUxp4SZ3moZt04n2ytoNtQfBYPbVuMf7xtoayXBW0=
X-Received: by 2002:a37:b6c4:: with SMTP id g187mr515094qkf.491.1623856588081; 
 Wed, 16 Jun 2021 08:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210616001302.84233-1-matthew.brost@intel.com>
In-Reply-To: <20210616001302.84233-1-matthew.brost@intel.com>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Wed, 16 Jun 2021 16:16:17 +0100
Message-ID: <CAHbf0-Fr-T=pn5q1wJYKdnnvw3+-f1YkZLNLp1aE3ZfNTs6R6g@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 0/3] Update firmware to v62.0.0
To: Matthew Brost <matthew.brost@intel.com>
Content-Type: multipart/alternative; boundary="000000000000197ee605c4e3937d"
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000197ee605c4e3937d
Content-Type: text/plain; charset="UTF-8"

Hi

Is there a place where we can download these new firmware images?

Cheers

Mike

On Wed, 16 Jun 2021 at 00:55, Matthew Brost <matthew.brost@intel.com> wrote:

> As part of enabling GuC submission [1] we need to update to the latest
> and greatest firmware. This series does that. All backwards
> compatibility breaking changes squashed into a single patch #2. Same
> series sent to trybot [2] forcing GuC to be enabled to ensure we haven't
> broke something.
>
> v2: Address comments, looking for remaning RBs so patches can be
> squashed and sent for CI
> v3: Delete a few unused defines, squash patches
> v4: Add values back into kernel doc, fix docs warning
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>
> [1] https://patchwork.freedesktop.org/series/89844
> [2] https://patchwork.freedesktop.org/series/91341
>
> Michal Wajdeczko (3):
>   drm/i915/guc: Introduce unified HXG messages
>   drm/i915/guc: Update firmware to v62.0.0
>   drm/i915/doc: Include GuC ABI documentation
>
>  Documentation/gpu/i915.rst                    |   8 +
>  .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  | 107 ++++++
>  .../gt/uc/abi/guc_communication_ctb_abi.h     | 126 +++++--
>  .../gt/uc/abi/guc_communication_mmio_abi.h    |  65 ++--
>  .../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 213 +++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc.c        | 107 ++++--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  45 +--
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 356 +++++++++---------
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h     |   6 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  75 +---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  29 +-
>  drivers/gpu/drm/i915/gt/uc/intel_guc_log.h    |   6 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  26 +-
>  13 files changed, 748 insertions(+), 421 deletions(-)
>
> --
> 2.28.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>

--000000000000197ee605c4e3937d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div>Is there a place where we can downlo=
ad these new firmware images?</div><div><br></div><div>Cheers</div><div><br=
></div><div>Mike</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, 16 Jun 2021 at 00:55, Matthew Brost &lt;<a hr=
ef=3D"mailto:matthew.brost@intel.com">matthew.brost@intel.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">As part of ena=
bling GuC submission [1] we need to update to the latest<br>
and greatest firmware. This series does that. All backwards<br>
compatibility breaking changes squashed into a single patch #2. Same<br>
series sent to trybot [2] forcing GuC to be enabled to ensure we haven&#39;=
t<br>
broke something.<br>
<br>
v2: Address comments, looking for remaning RBs so patches can be<br>
squashed and sent for CI<br>
v3: Delete a few unused defines, squash patches<br>
v4: Add values back into kernel doc, fix docs warning<br>
<br>
Signed-off-by: Matthew Brost &lt;<a href=3D"mailto:matthew.brost@intel.com"=
 target=3D"_blank">matthew.brost@intel.com</a>&gt;<br>
<br>
[1] <a href=3D"https://patchwork.freedesktop.org/series/89844" rel=3D"noref=
errer" target=3D"_blank">https://patchwork.freedesktop.org/series/89844</a>=
<br>
[2] <a href=3D"https://patchwork.freedesktop.org/series/91341" rel=3D"noref=
errer" target=3D"_blank">https://patchwork.freedesktop.org/series/91341</a>=
 <br>
<br>
Michal Wajdeczko (3):<br>
=C2=A0 drm/i915/guc: Introduce unified HXG messages<br>
=C2=A0 drm/i915/guc: Update firmware to v62.0.0<br>
=C2=A0 drm/i915/doc: Include GuC ABI documentation<br>
<br>
=C2=A0Documentation/gpu/i915.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +<br>
=C2=A0.../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h=C2=A0 | 107 ++++++<br>
=C2=A0.../gt/uc/abi/guc_communication_ctb_abi.h=C2=A0 =C2=A0 =C2=A0| 126 ++=
+++--<br>
=C2=A0.../gt/uc/abi/guc_communication_mmio_abi.h=C2=A0 =C2=A0 |=C2=A0 65 ++=
--<br>
=C2=A0.../gpu/drm/i915/gt/uc/abi/guc_messages_abi.h | 213 +++++++++++<br>
=C2=A0drivers/gpu/drm/i915/gt/uc/intel_guc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1=
07 ++++--<br>
=C2=A0drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c=C2=A0 =C2=A0 |=C2=A0 45 +-=
-<br>
=C2=A0drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c=C2=A0 =C2=A0 =C2=A0| 356 ++=
+++++++---------<br>
=C2=A0drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h=C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A06 +-<br>
=C2=A0drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h=C2=A0 =C2=A0|=C2=A0 75 +-=
--<br>
=C2=A0drivers/gpu/drm/i915/gt/uc/intel_guc_log.c=C2=A0 =C2=A0 |=C2=A0 29 +-=
<br>
=C2=A0drivers/gpu/drm/i915/gt/uc/intel_guc_log.h=C2=A0 =C2=A0 |=C2=A0 =C2=
=A06 +-<br>
=C2=A0drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
26 +-<br>
=C2=A013 files changed, 748 insertions(+), 421 deletions(-)<br>
<br>
-- <br>
2.28.0<br>
<br>
_______________________________________________<br>
Intel-gfx mailing list<br>
<a href=3D"mailto:Intel-gfx@lists.freedesktop.org" target=3D"_blank">Intel-=
gfx@lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/intel-gfx" rel=3D=
"noreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listin=
fo/intel-gfx</a><br>
</blockquote></div>

--000000000000197ee605c4e3937d--
