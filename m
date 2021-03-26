Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA29034A7C5
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 14:03:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3798B6E20E;
	Fri, 26 Mar 2021 13:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C351E6E201
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 13:03:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3178E619F3;
 Fri, 26 Mar 2021 13:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1616763816;
 bh=7nZUvZiNR1Ilz4n3bwQkwZDwZoMX0OktOORjC+8pYQk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tVKC55fT54U9/yvEY1S6+OO/8e9HKSpvGLRlC/OwkVBjqoDsYnfhkJWAa9k41A103
 bVctoqZFNiynpQ5prWaqlepSKOGmR02JpK5zzfDSglSfrCArP63vrfP6KjiNTI+W10
 ny2gWoz0Bl+iR0U/wNdorBH1X+UnVnlxzuAIxKfA=
Date: Fri, 26 Mar 2021 14:03:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Carlis <zhangxuezhi3@gmail.com>
Subject: Re: [PATCH v2] staging: fbtft: fix a typo
Message-ID: <YF3bpuh8RVg+3Nx3@kroah.com>
References: <1616763351-7433-1-git-send-email-zhangxuezhi3@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616763351-7433-1-git-send-email-zhangxuezhi3@gmail.com>
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

On Fri, Mar 26, 2021 at 08:55:51PM +0800, Carlis wrote:
> From: Xuezhi Zhang <zhangxuezhi1@yulong.com>
> 
> Change 'tft' to 'TFT'

That says what you did, but not _why_ you did it.

And this is not a "typo", as it is not misspelled and really is just
fine as-is.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
