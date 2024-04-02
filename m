Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8DC894D06
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 09:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A611910FB08;
	Tue,  2 Apr 2024 07:56:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Jb5Cs+AP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F65B10FB00;
 Tue,  2 Apr 2024 07:56:42 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D46938B9;
 Tue,  2 Apr 2024 09:56:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1712044564;
 bh=3FI6n6LYhHgKYaXZ5dykq7jIVDxDcISNhii4Jg7lEok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jb5Cs+AP6ZTZbxlLKQjp/iE+74pBpVWEtBE4ymfRhlDXJEswmunX9K4vCmJiDzvX5
 cEp2L5m3j59EkjzCT2caW5vAgx2vitxByicZFJyuMko0rdmRgbY9SEZA28U1mIfZia
 GLdWIcKuDbfIDO9FccdFi6rBOikXfuVIKroIZoBc=
Date: Tue, 2 Apr 2024 10:56:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Christopher Michael <cmichael@igalia.com>, events@lists.x.org,
 xorg-devel@lists.x.org, wayland-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, mesa-dev@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, libre-soc-dev@lists.libre-soc.org,
 elections@x.org, members@x.org, xorg@lists.freedesktop.org
Subject: Re: 2024 X.Org Foundation Membership deadline for voting in the
 election
Message-ID: <20240402075630.GA10288@pendragon.ideasonboard.com>
References: <0efcdfe3-ea9e-43e5-ab07-6d69dca2c04a@igalia.com>
 <57dd238b-2b94-4b46-a8be-c53b2f985e46@igalia.com>
 <20240402104608.6f6a9121@eldfell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240402104608.6f6a9121@eldfell>
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

Hi Pekka,

On Tue, Apr 02, 2024 at 10:46:08AM +0300, Pekka Paalanen wrote:
> On Tue, 26 Mar 2024 11:42:48 -0400 Christopher Michael wrote:
> 
> > The 2024 X.Org Foundation membership renewal period has been extended 
> > one additional week and elections will start the following week on 01 
> > April 2024.
> > 
> > Please note that only current members can vote in the upcoming election, 
> > and that the deadline for new memberships or renewals to vote in the 
> > upcoming election is 01 April 2024 at 23:59 UTC.
> > 
> > If you are interested in joining the X.Org Foundation or in renewing 
> > your membership, please visit the membership system site at: 
> > https://members.x.org/
> > 
> > Christopher Michael, on behalf of the X.Org elections committee
> 
> Hi everyone,
> 
> given that the year's first email reminding everyone to renew their
> memberships was sent on Feb 7 when the renewal was NOT open yet, I
> wonder how many people thought they had already renewed and are now
> thinking they don't need to do anything?
> 
> I fell for that: On Feb 7, I went to members.x.org to check my status,
> it said I was registered for "2023-2024" and there was no button to
> renew, so I closed the page confident that I was a member for 2024.
> After all, it said 2024. This was a mistake I realised only after being
> personally poked to renew. I know for sure of one other person falling
> for the same.

Make that two. Thanks for the notice.

> Now, the members page for this year says "Application for the period:
> 02/2024-02/2025". Thanks to the people adding the month to reduce
> confusion.

-- 
Regards,

Laurent Pinchart
