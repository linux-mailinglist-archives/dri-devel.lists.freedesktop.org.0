Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E88A3EB16
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 04:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B0310E1B8;
	Fri, 21 Feb 2025 03:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VFDagafo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206A110E1B8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 03:10:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1220C5C6287;
 Fri, 21 Feb 2025 03:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AECC4CEE2;
 Fri, 21 Feb 2025 03:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740107435;
 bh=Oq1X5TNC2tWMxrSbGulpzxocpjGNFsSObQBCaMkillk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VFDagafou7PhexlxWZhuXdvPDLL6bFX4N3BQgpMhHL2C1RXcjgLGkUzdvcvslmmQ/
 /L8gT3+0dIB3ay+rShwnpTg5cqkkHQ4lDS/md1XkbzO7nJLvnr9T4s7YzGoag+BH8q
 qj+l84vSD1RWrUq62goAdPGghHffRulNDGNYIoiG4V6Hg4HrqdecrKvrZ1d9x+4eci
 o53AHHNA0h6BZCCmR+Ga3NTK/1nc1oqq3qcriVH+BufZclZ+/g/dVBfM3gsgFsvUZ3
 hAGQcwxgY6AVU6Zahao3GoOkhGHM2DmGPDqsYf+UG0x9eYzYqgWWKNvWgzgQwT9Go1
 7HbHFpHxwungw==
Date: Thu, 20 Feb 2025 21:10:32 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: quic_carlv@quicinc.com, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: Update my email address
Message-ID: <x5rkidwwklcqspbukzhkx26vldjhnohff6lshezgondltibvwx@e4jadrlop52i>
References: <20250219214112.2168604-1-jeff.hugo@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219214112.2168604-1-jeff.hugo@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 19, 2025 at 02:41:12PM -0700, Jeff Hugo wrote:
> Qualcomm is migrating away from quicinc.com email addresses towards ones
> with *.qualcomm.com.
> 
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  .mailmap    | 3 ++-
>  MAINTAINERS | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/.mailmap b/.mailmap
> index ae0adc499f4a..f4b927e48ad1 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -320,7 +320,8 @@ Jeff Garzik <jgarzik@pretzel.yyz.us>
>  Jeff Layton <jlayton@kernel.org> <jlayton@poochiereds.net>
>  Jeff Layton <jlayton@kernel.org> <jlayton@primarydata.com>
>  Jeff Layton <jlayton@kernel.org> <jlayton@redhat.com>
> -Jeffrey Hugo <quic_jhugo@quicinc.com> <jhugo@codeaurora.org>
> +Jeff Hugo <jeff.hugo@oss.qualcomm.com> <jhugo@codeaurora.org>
> +Jeff Hugo <jeff.hugo@oss.qualcomm.com> <quic_jhugo@quicinc.com>
>  Jens Axboe <axboe@kernel.dk> <axboe@suse.de>
>  Jens Axboe <axboe@kernel.dk> <jens.axboe@oracle.com>
>  Jens Axboe <axboe@kernel.dk> <axboe@fb.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 950e8b7c0805..815a28c7e6fc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19426,7 +19426,7 @@ F:	drivers/clk/qcom/
>  F:	include/dt-bindings/clock/qcom,*
>  
>  QUALCOMM CLOUD AI (QAIC) DRIVER
> -M:	Jeffrey Hugo <quic_jhugo@quicinc.com>
> +M:	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>  R:	Carl Vanderlip <quic_carlv@quicinc.com>
>  L:	linux-arm-msm@vger.kernel.org
>  L:	dri-devel@lists.freedesktop.org
> -- 
> 2.34.1
> 
> 
