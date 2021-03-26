Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7DA34A955
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 15:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143186F3DA;
	Fri, 26 Mar 2021 14:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0C0B6F3DA
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 14:12:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3610061A02;
 Fri, 26 Mar 2021 14:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616767929;
 bh=dNtp5Lk+sXW82yd48pelyEyjW5yjUsssA7DFylEmuLw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fn7DSFHS3yMmhMAxVGz2owWcH9UTzABGUdycSuUGVI97ByV7+kVg/yckeuv35Lt7e
 cv+5S5tvgWEuIQoSnN4jeQZWN5WrNGv3dgPSbk0wG9HiB4yTZCb1cpTSWIPa9YP8q2
 sjMem1eA+dIs2chvYQ56Ej8OauQsXcmxKoNwZ3X4=
Date: Fri, 26 Mar 2021 15:12:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Carlis <zhangxuezhi3@gmail.com>
Subject: Re: [PATCH] staging: fbtft: change '16 bit' to '16-bit'
Message-ID: <YF3rt28vKzt7CDIh@kroah.com>
References: <1616767770-70063-1-git-send-email-zhangxuezhi3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616767770-70063-1-git-send-email-zhangxuezhi3@gmail.com>
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
Cc: zhangxuezhi1@yulong.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 26, 2021 at 10:09:30PM +0800, Carlis wrote:
> From: "carlis.zhang_cp" <zhangxuezhi1@yulong.com>
> 
> Change '16 bit' to '16-bit' for a same style.

Why?  This is up to the author.

> 
> Signed-off-by: carlis.zhang_cp <zhangxuezhi1@yulong.com>

Please use a real name, not an email-alias as a name.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
