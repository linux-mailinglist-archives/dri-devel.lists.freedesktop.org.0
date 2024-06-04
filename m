Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 063FD8FB9A1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 18:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5923310E564;
	Tue,  4 Jun 2024 16:55:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="FCZOhq7F";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="UMDiUAGm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE0C10E564
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 16:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=0NjRCl+7jiiMzg5z9FSdtZmma2lSKy7+IfJACdpBDBY=;
 b=FCZOhq7FCa6SEUHtgq56nbgcNAtga4DfkSIW4VExu9iko4JiYIYuL0hO9mBS3bMbO2fYK8Y8d5ysT
 QPfVorBIQqWTaXgUqjguBuGS2GzZeF2B0zNMHGWitS0wvWveje+TfoEDuIox2wzdHzSYMW965wAyTs
 U4ze6LXRAX3IyWrpjhfnv9T0XoIVsRm9BHUzKo8jMCo3HSaRVwjxWnYd0E5x1q41y+PqLEODbrjJvh
 VySi6as9n3zAnDV0WRS0VZIuKpcERlMo23isFzcFvgcrb3AMnQE4deFYG2frniSUn7uLKRsM3pg6tO
 KhZk5rL7tFRwWVFUT06yfiSnmMnYBGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=0NjRCl+7jiiMzg5z9FSdtZmma2lSKy7+IfJACdpBDBY=;
 b=UMDiUAGmTX5Wam12BBl/sll83OLJqkKyBfu6GnALab8aT3R6IXiw8+t5lCn6TSxsLLmSbgmpwghbX
 +LbShH9Dw==
X-HalOne-ID: 0a51b4b8-2293-11ef-884d-edf132814434
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay5.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id 0a51b4b8-2293-11ef-884d-edf132814434;
 Tue, 04 Jun 2024 16:54:02 +0000 (UTC)
Date: Tue, 4 Jun 2024 18:54:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] MAINTAINERS: drm: Drop sam as panel reviewer
Message-ID: <20240604165401.GA61046@ravnborg.org>
References: <20240530211402.GA1660596@ravnborg.org>
 <171740437658.4156184.5628747747427694739.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171740437658.4156184.5628747747427694739.b4-ty@linaro.org>
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

Hi Neil,

On Mon, Jun 03, 2024 at 10:46:16AM +0200, Neil Armstrong wrote:
> Hi,
> 
> On Thu, 30 May 2024 23:14:02 +0200, Sam Ravnborg wrote:
> > Drop myself as reviewer of panel patches, to reflect the reality.
> > 
> > 
> 
> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

Thank you!

	Sam
