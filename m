Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA7B34A33B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 09:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 272C06EB9D;
	Fri, 26 Mar 2021 08:37:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E136EB93
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 08:37:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47D6861A44;
 Fri, 26 Mar 2021 08:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616747870;
 bh=HGsGnoth2ZOZS+sjsAFalgHFAKd065RGy6pi92g7wx0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BJ8z8x6vuSW6qeM5GEtRUqkwRr9Zc4YHEx1EzbEMy9KlkAep15GklBnnZlMMqEOlI
 i+4EMw6EyHbAok6ri9e+irAT1PXuX4PwPNDFryc97mEKcvmc2Ur1yK138ZwE49889E
 ZhQiMMpRtlbJlvAe38UUpknc/Ofh1MQ0zwiDtepY=
Date: Fri, 26 Mar 2021 09:37:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Carlis <zhangxuezhi3@gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix a typo
Message-ID: <YF2dXIxMOUyLzfnQ@kroah.com>
References: <1616745915-194644-1-git-send-email-zhangxuezhi3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616745915-194644-1-git-send-email-zhangxuezhi3@gmail.com>
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
Cc: zhangxuezhi1@yulong.com, linux-staging@lists.linux.dev,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 26, 2021 at 04:05:15PM +0800, Carlis wrote:
> From: "Carlis" <zhangxuezhi1@yulong.com>
> 
> Change 'tft' to 'TFT'

Why?  What is wrong with "tft"?

> 
> Signed-off-by: Carlis <zhangxuezhi1@yulong.com>

Full name please.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
