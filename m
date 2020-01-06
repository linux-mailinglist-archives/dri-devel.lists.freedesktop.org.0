Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7F6131605
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2020 17:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3D76E4AA;
	Mon,  6 Jan 2020 16:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD2E6E4AD;
 Mon,  6 Jan 2020 16:28:06 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 8277F80536;
 Mon,  6 Jan 2020 17:28:03 +0100 (CET)
Date: Mon, 6 Jan 2020 17:28:02 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Christian Gmeiner <christian.gmeiner@gmail.com>
Subject: Re: [PATCH v2 0/6] update hwdw for gc400
Message-ID: <20200106162802.GA20675@ravnborg.org>
References: <20200106151655.311413-1-christian.gmeiner@gmail.com>
 <20200106153643.GA8535@ravnborg.org>
 <CAH9NwWd7C+DzAKe97kURm=sGjDH+KQJOif3j=w6K+99xmYGncQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH9NwWd7C+DzAKe97kURm=sGjDH+KQJOif3j=w6K+99xmYGncQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=D19gQVrFAAAA:8
 a=xMcAtTC5Z7CYE8FbCH0A:9 a=CjuIK1q_8ugA:10 a=JZBxSqCIBzwA:10
 a=W4TVW4IDbPiebHqcZpNg:22
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
Cc: David Airlie <airlied@linux.ie>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian.

> To be honest.. I forgot the change log thing this time - sorry.
It was small changes - so no worries.

> So the rule
> is to have the change log in the normal commit message?
This is what Danial Vetter tell people - but it is not documented as
far as I can tell.

> Funny - Lucas told me something different:
> 
> "Please move those changelogs below the 3 dashes, so they don't end up
> in the commit message. They don't really add any value to the
> persistent kernel history."
> https://lkml.org/lkml/2019/9/13/107
Lucas is maintainer of etnaviv driver - so do as he says.

Keep up the good work on etnaviv in mesa too!

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
