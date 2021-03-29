Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0645434D3F9
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 17:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D7D6E47A;
	Mon, 29 Mar 2021 15:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7950789C85
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 15:32:52 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 k14-20020a9d7dce0000b02901b866632f29so12681267otn.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 08:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J0PX3YGiA1lRp5I9tvaB7FhBfF0VCV3+C5FuFXW+3N8=;
 b=R7qAXPo48MkDyupC5FF0SAnrIPYqalufQi9jEF/AyiXeGdwtpjQKC2IISZQTDm0Ljy
 18iydmPuOnu4AqvRU50XKLjmTke58w2qa/CvRl56PD5Ip2u56geTp4QOPM0QDP9EFAbh
 DuKRql5xpAoKDSIwtkKbW4LnwQFO6UhJVqAa27TGm+ZokArrK8RIqyXIUtU/Wn8pTU1I
 BtU8omQwOIzfYpnhggk3SEr2k6QV9MTpNWvFN+eNLhgMfu153v9z9LQVSUPwT5guljTk
 PDQa+NKbRwzKA3wDy6tk9zegryjuiaUfn51ag1I8Ky+QCyDiRUIarOPV7aoFwhbXdeD/
 ECwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J0PX3YGiA1lRp5I9tvaB7FhBfF0VCV3+C5FuFXW+3N8=;
 b=LI6shSFv8saP9QmSSIBfHOvXKg0Ynxwl8L9vqNHz5Cw4tIaRZNu0HMlaeMYpusq0TT
 SojZqOaiQicx+DbE020k9IAMMhMF5fAA/E06d4K8VgtJGWNMYBgk2cH0Fkb23BXBl/s0
 1t553GNYWoRMMGbVXAfNDUGVcWCeGm9KyQTDJ9fgHNZG86ZISQOI6YXZxRlSPLV9Ib/I
 6Q8rLqsQBcEQYnjOfMD0jadn8B8vDASStwMInx0Tc1hw2dfe6RnZYAHu4t6gRhEAYRWl
 cw53+Qy9V1G9aJQMbXVTw3Jf39izjS2wu1Ejg1stUfzgavW9l3VZfYe2yXUAKqZQU5D7
 lx8Q==
X-Gm-Message-State: AOAM530QQnqFxxS0ZpduZ3Z0iV0dwueM0xp9XTKeK2zFpvXjxPd/K/w9
 wqKBV+z9cT7v6ZVxtlBdHuTWLJDuBXsQD5yTKdg=
X-Google-Smtp-Source: ABdhPJxOsimt6cr4luFOFVZJ1XwLCVtQsyBX4tfE7t6HW5CPDFCtTqM68H6vH2Q/ipFoOCqxTayhzNmhx7KLfgaHZbk=
X-Received: by 2002:a05:6830:408f:: with SMTP id
 x15mr23976678ott.132.1617031971817; 
 Mon, 29 Mar 2021 08:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210328053504.164301-1-diego.viola@gmail.com>
In-Reply-To: <20210328053504.164301-1-diego.viola@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Mar 2021 11:32:41 -0400
Message-ID: <CADnq5_OTU-zVsKTOmxGMEhvTWrGUAVoqhFoQvjg-4ryQmi5xew@mail.gmail.com>
Subject: Re: [TRIVIAL] drm/amd/display: fix typo: liason -> liaison
To: Diego Viola <diego.viola@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Jiri Kosina <trivial@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sun, Mar 28, 2021 at 1:35 AM Diego Viola <diego.viola@gmail.com> wrote:
>
> Signed-off-by: Diego Viola <diego.viola@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 573cf17262da..1b4b4f508662 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -121,7 +121,7 @@ MODULE_FIRMWARE(FIRMWARE_NAVI12_DMCU);
>   * DOC: overview
>   *
>   * The AMDgpu display manager, **amdgpu_dm** (or even simpler,
> - * **dm**) sits between DRM and DC. It acts as a liason, converting DRM
> + * **dm**) sits between DRM and DC. It acts as a liaison, converting DRM
>   * requests into DC requests, and DC responses into DRM responses.
>   *
>   * The root control structure is &struct amdgpu_display_manager.
> --
> 2.31.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
