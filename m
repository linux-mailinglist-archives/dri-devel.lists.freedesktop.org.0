Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1193034A47A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 10:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22DA6E18E;
	Fri, 26 Mar 2021 09:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4ECC6E18E
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 09:34:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3B7460190;
 Fri, 26 Mar 2021 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616751240;
 bh=ozywuCe/NeMTTH6FqmHhUeqC8Fwy1YXXVeK7rORIDy8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WIlycJAf81tbDszupCyGPvoi3Ds3VV+CJbENSkdZVExP9PqjQnzVsd4KUbRTZ5HKq
 gfVqhdCst39/COBH2bcdsjYez9EJ/6eOOdB9fqWjnvrrbf1di+BnGG1CchhWYfsyOd
 QQvo7NuesBq/UP82PmTyEy8SF2EMYtvxPayHiua8=
Date: Fri, 26 Mar 2021 10:33:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: carlis <zhangxuezhi3@gmail.com>
Subject: Re: [PATCH] staging: fbtft: fix a typo
Message-ID: <YF2qhUD1lz3LbEhC@kroah.com>
References: <1616745915-194644-1-git-send-email-zhangxuezhi3@gmail.com>
 <YF2dXIxMOUyLzfnQ@kroah.com> <20210326171634.000011f5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210326171634.000011f5@gmail.com>
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

On Fri, Mar 26, 2021 at 05:16:34PM +0800, carlis wrote:
> On Fri, 26 Mar 2021 09:37:48 +0100
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > On Fri, Mar 26, 2021 at 04:05:15PM +0800, Carlis wrote:
> > > From: "Carlis" <zhangxuezhi1@yulong.com>
> > > 
> > > Change 'tft' to 'TFT'  
> > 
> > Why?  What is wrong with "tft"?
> > 
> I think abbreviations should be capitalized.

Why?  What requires this?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
