Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2B6366F96
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 17:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4F96E9CB;
	Wed, 21 Apr 2021 15:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADFC6E9CB
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 15:59:27 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 p10-20020a1c544a0000b02901387e17700fso1506263wmi.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XnkxYIAKutKv4kViS3kydcQtGekYW3fOBH7MwLHtFek=;
 b=b9bn77pcTFeeIc+5vLbE57enRpaMgIHjYKj0Al67qbIkQ5dSOIZ/wUtxBP13u5PCeb
 VTPz/aYWnpJgPlkQvaZK/JzykWSCNO94bRksduB2783rKEWH3pr+f3Lh+PkFrMutZbQQ
 zWOd9/D0PU5e31PAXz1xpEYHmABSMIYduTJ/eVCXzmfzDGD+A0MBzCpJpbSs2ICFjKwd
 EMvw6AND1SvTt45AAARXW6GccY/IqmKzDRWLpGOWKeyGNfcbwokpGbmMetzaKD3G/kVT
 l2fio6V81Jx3khVGsThfmOhWzt7smO3cwBxLc5qKF5dJV2HSDWByNyFhjc8l7anvvFgq
 4DjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XnkxYIAKutKv4kViS3kydcQtGekYW3fOBH7MwLHtFek=;
 b=AuRJrNi24MN7AhcDgHQeBOmAOl/DRO8VdhU21720r6L3Xy8ZvIpkVU3ylwBu5hHHVF
 atJ6ObBoZGfGYtlfPlac34MA+A5ePFpVVqKpm/VbCvgXNEt/Mn+DhUrfEvQzrkjhueJP
 95GEwVF1tWdp0hIbais97v4baAjJ8839aiFyKtRz1rFi4Y5i+8QwJbfpPj5KbqFyaG+T
 nZciOpDKo+OZwgkPvhmPm9eZDEEob0dxZH2DDX7r4ncaUCTIfJF1qXKlGzDEtDI6vEXL
 QeWigSft0MOyNi9WWjiS4ioiHbuJoMmw7PwoYXG6wqt0GTHfGnxlwZKsnOD+r71tBhMw
 KsGw==
X-Gm-Message-State: AOAM530X9KBoibrc4LtCZ45RNUgKa7oHROef4Xnr42w67QtZzWlbeYKF
 tutDT0NewmkKNmj1jQTyyi4=
X-Google-Smtp-Source: ABdhPJxJox10WO/5VfWxvKn6Zyx9ISbYNaNESbM4XWGhbPmvPfSzH5r8edTNXXdgfT1A56jN9REi1g==
X-Received: by 2002:a1c:457:: with SMTP id 84mr10433627wme.38.1619020766356;
 Wed, 21 Apr 2021 08:59:26 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id 18sm2770311wmo.47.2021.04.21.08.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 08:59:25 -0700 (PDT)
Date: Wed, 21 Apr 2021 12:59:18 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/todo: Add link to old debugfs RFC
Message-ID: <20210421155918.4onrlub374xbkcds@smtp.gmail.com>
References: <20210421152911.1871473-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421152911.1871473-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Wambui Karuga <wambui.karugax@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/21, Daniel Vetter wrote:
> I always forget where it was, store it until this gets picked up by an
> internship again.
> 
> Cc: Wambui Karuga <wambui.karugax@gmail.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> ---
>  Documentation/gpu/todo.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 7ff9fac10d8b..12e61869939e 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -546,6 +546,8 @@ There's a bunch of issues with it:
>    this (together with the drm_minor->drm_device move) would allow us to remove
>    debugfs_init.
>  
> +Previous RFC that hasn't landed yet: https://lore.kernel.org/dri-devel/20200513114130.28641-2-wambui.karugax@gmail.com/
> +

Acked-by: Melissa Wen <melissa.srw@gmail.com>

>  Contact: Daniel Vetter
>  
>  Level: Intermediate
> -- 
> 2.31.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
