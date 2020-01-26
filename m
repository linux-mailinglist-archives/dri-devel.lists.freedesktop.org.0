Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8106814998C
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jan 2020 08:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDAD76E1F4;
	Sun, 26 Jan 2020 07:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEFDA6E1F4
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2020 07:43:15 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3F5A120842;
 Sun, 26 Jan 2020 07:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580024594;
 bh=CHQkFKUOmA5YtxD0wl33gMO4LhTAp+CGsnM+wPrpj4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sv8cfWWrjgWlhTkSLAseYHSMMz5heUhQH7G8yEWDDNSrAyjHsTZt046fLNytyWlGC
 5ablhIqnxhtetOADvRZsOgnLesHwFhFcxPJmFCWVBjuvLeLiEZBgFFyU9lbfZDgHlQ
 VlZFT0ZK4sDWcVqqvNL8mjszgVRWM4culvdiHriI=
Date: Sun, 26 Jan 2020 08:17:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rich Felker <dalias@libc.org>
Subject: Re: [PATCH] matroxfb: add Matrox MGA-G200eW board support
Message-ID: <20200126071724.GA3520745@kroah.com>
References: <20200125195506.GA16638@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200125195506.GA16638@brightrain.aerifal.cx>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 25, 2020 at 02:55:06PM -0500, Rich Felker wrote:
> Signed-off-by: Rich Felker <dalias@libc.org>
> --

I know I don't accept patches without any changelog text, don't know
about other subsystem maintainers...

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
