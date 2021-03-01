Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42448327A49
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 10:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E1626E51A;
	Mon,  1 Mar 2021 09:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083906E51A
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 09:01:28 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id w11so15209591wrr.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 01:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=g4W5dBF0qbRtxiyxch5HU6fNLbEdEIt4hBih+QxI3w8=;
 b=Sz03B40DODgMbYlNZxdd6btsImGzluXrVtdlrURVlm2GNl7qJqQa7YPSuOPjuHzASY
 MbDhfFV7IF51PEpyOhGvzMHmKlmfinyds1Lvs2F6r1DK+GuJThNKQH77skFVrjMcEM32
 2ooAKsnRlAAxxeRKT8KMB1OfyQwxxGekJpDXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=g4W5dBF0qbRtxiyxch5HU6fNLbEdEIt4hBih+QxI3w8=;
 b=rZNB31Xu8jgh5iyA5k/k+hCa/XhdwIdrMUAWp1wkoRseZewuU1WOV9a5x3Vj1HoTA6
 95nQFuJs16XeRTgg4vK+LZYjgG7vZ+rIbb5z5GS/xZlteZMnny0eGNydtc4P0fKk7UX7
 qbUwI4gTvl5X4ZYtSweEsPmKn6WkYdCC6hOHpK84GNCzorn92yXSeqtzevX98/lzdVBR
 BE9s3vqcEK9Aem3wubBLiTkuQj+njXP1Mn7Sa6Wd9l9gH/W13C0sgcwysTJ+DCxMjHJj
 tRMPzlIbPSB72dnS2Ss2YgaEHYWawajjpEA9V1D821YB9aLZxpkicLbOym1LtXPE2Yiv
 EYiw==
X-Gm-Message-State: AOAM533GYWpgSkQ627vAFHfBzojvXDtM0AOmhHQWyujbmCwn9C5A0C1V
 cHppD/NkKyAdV4hsY4Bo4swddw==
X-Google-Smtp-Source: ABdhPJxGV5UZhGGDfGhp16kC0XG9seTn+X9JCgKx3K456MS2XOEVB9n7TMxtH0TTGcCcP1/OPPz5ZA==
X-Received: by 2002:adf:ecca:: with SMTP id s10mr7840199wro.324.1614589286762; 
 Mon, 01 Mar 2021 01:01:26 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t7sm20020214wmq.44.2021.03.01.01.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 01:01:26 -0800 (PST)
Date: Mon, 1 Mar 2021 10:01:24 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Pavel =?iso-8859-1?Q?Turinsk=FD?= <ledoian@kam.mff.cuni.cz>
Subject: Re: [PATCH] MAINTAINERS: update drm bug reporting URL
Message-ID: <YDytZE/AupG2NoHg@phenom.ffwll.local>
Mail-Followup-To: Pavel =?iso-8859-1?Q?Turinsk=FD?= <ledoian@kam.mff.cuni.cz>, 
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, trivial@kernel.org
References: <20210228163658.54962-1-ledoian@kam.mff.cuni.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210228163658.54962-1-ledoian@kam.mff.cuni.cz>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: airlied@linux.ie, trivial@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 28, 2021 at 05:36:58PM +0100, Pavel Turinsk=FD wrote:
> The original bugzilla seems to be read-only now, linking to the gitlab
> for new bugs.
> =

> Signed-off-by: Pavel Turinsk=FD <ledoian@kam.mff.cuni.cz>
> Cc: trivial@kernel.org

Queued up for 5.12, thanks for your patch.
-Daniel

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/MAINTAINERS b/MAINTAINERS
> index bfc1b86e3e73..434adb869522 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5793,7 +5793,7 @@ M:	David Airlie <airlied@linux.ie>
>  M:	Daniel Vetter <daniel@ffwll.ch>
>  L:	dri-devel@lists.freedesktop.org
>  S:	Maintained
> -B:	https://bugs.freedesktop.org/
> +B:	https://gitlab.freedesktop.org/drm
>  C:	irc://chat.freenode.net/dri-devel
>  T:	git git://anongit.freedesktop.org/drm/drm
>  F:	Documentation/devicetree/bindings/display/
> -- =

> 2.20.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
