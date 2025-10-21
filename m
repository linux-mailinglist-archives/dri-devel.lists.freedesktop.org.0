Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781ABBF5D47
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 12:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F61510E2F4;
	Tue, 21 Oct 2025 10:39:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lzCFh0QC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF8210E2F4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 10:39:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2C3A640517;
 Tue, 21 Oct 2025 10:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719B0C4CEF1;
 Tue, 21 Oct 2025 10:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761043144;
 bh=3q6sXrG7VRtYkwyyX371flcjfB6mMLFODYR2Y1GJ5ro=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lzCFh0QCeSof5RGIYPgGsaVe+nfXHn62yajRTCSVY6Y5LBFLXL7w8glp6OxLn0Ql1
 Hc+Wp5iftVS8nioy0xmGRMec1B77StL0+tw4bf91loDKoDzJzgv36l3oX48nXFaQVd
 o13FxnAfXbR7x5ewNSPsHfi1WVA5GkKcvTNlSIDovjH1rZuBTvOR6T585csT4M9YnS
 Ke9zX83BafZh1gPaY8LFPoqgsWh2dIlqaw+rW4M86Slz5kU+9fcG+O5piM6SmiTeRl
 lQulycs9DTZDyOmG9PFRuKgc7yY68DnfnMf3U94ZOUm4fvAbJuvyADTbkM6LDb+Rcw
 XzfAdkChKjTSg==
Date: Tue, 21 Oct 2025 11:38:59 +0100
From: Lee Jones <lee@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, linux-sunxi@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] MAINTAINERS: Update Chen-Yu's email address
Message-ID: <20251021103859.GB475031@google.com>
References: <20251020045603.2573544-1-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020045603.2573544-1-wens@kernel.org>
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

On Mon, 20 Oct 2025, Chen-Yu Tsai wrote:

> The email forwarder I'm using has run into severe problems with Gmail
> lately. Switch over to my kernel.org address for kernel development.
> 
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
> ---
> (resent to correct dri-devel mailing list address)
> 
> This likely needs to go through drm-misc-next following a patch from
> Maxime that removed himself from the Allwinner DRM driver entries.
> 
>  .mailmap    | 1 +
>  MAINTAINERS | 8 ++++----
>  2 files changed, 5 insertions(+), 4 deletions(-)

Acked-by: Lee Jones <lee@kernel.org>

-- 
Lee Jones [李琼斯]
