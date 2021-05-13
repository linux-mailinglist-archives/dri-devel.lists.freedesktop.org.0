Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AED37F50E
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 11:51:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D31E6E09E;
	Thu, 13 May 2021 09:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 33257 seconds by postgrey-1.36 at gabe;
 Thu, 13 May 2021 09:51:38 UTC
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
 by gabe.freedesktop.org (Postfix) with ESMTP id 80E6B6E09E
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 09:51:38 +0000 (UTC)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 87E3392009C; Thu, 13 May 2021 11:51:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 792E892009B;
 Thu, 13 May 2021 11:51:35 +0200 (CEST)
Date: Thu, 13 May 2021 11:51:35 +0200 (CEST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v2 0/3] VT_RESIZEX fixes
Message-ID: <alpine.DEB.2.21.2105131132100.3032@angie.orcam.me.uk>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: linux-fbdev@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Martin Hostettler <textshell@uchuujin.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peilin Ye <yepeilin.cs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

 This is a minor update to the previous version of the series, adding a 
clarification to 3/3 as to the problem the original fix to which caused 
the functional regression the removal of extra VT_RESIZEX parameter 
handling caused.  No change to actual code.

 See individual change descriptions for details.

 Please apply.

  Maciej
