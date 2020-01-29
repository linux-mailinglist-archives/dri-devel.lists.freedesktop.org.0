Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA4214D152
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 20:47:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E32A6E42D;
	Wed, 29 Jan 2020 19:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB2B6E42D
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 19:47:15 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 9FDDF8046E;
 Wed, 29 Jan 2020 20:47:12 +0100 (CET)
Date: Wed, 29 Jan 2020 20:47:11 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Benjamin Gaignard <benjamin.gaignard@linaro.org>
Subject: Re: [PATCH v2 2/2] dt-bindings: one file of all simple DSI panels
Message-ID: <20200129194711.GA29646@ravnborg.org>
References: <20200102101712.5085-1-sam@ravnborg.org>
 <20200102101712.5085-3-sam@ravnborg.org>
 <CA+M3ks5Zs5j0FMD4SQiva2soW62tSnu14qiq3kErhLvCMxrxAA@mail.gmail.com>
 <CAL_Jsq+g8mVdC=aOZDpMGMt3j1Y=Lgku-OcfoBP_V7PGabq5Lg@mail.gmail.com>
 <CA+M3ks4sD971mCUQRJO+9gXaAWcwgzy2iNtMNVBRov5JSJk=HQ@mail.gmail.com>
 <CA+M3ks7GkVSi2WcwpK+tkoBx=EpJLfFVAp=qs2ygZyW114hWfw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+M3ks7GkVSi2WcwpK+tkoBx=EpJLfFVAp=qs2ygZyW114hWfw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=2pC7oDVXEgjFpRlVQu8A:9 a=CjuIK1q_8ugA:10
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Yannick Fertre <yannick.fertre@st.com>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Benjamin.
> > >
> > > Here's the problem. If it is not required, then panels with multiple
> > > supplies will get added here because they didn't care to begin with.
> > > Then when someone decides to think about the supplies it will have to
> > > be moved. Bindings need to be complete from the start.
> >
> > Fair enough, I will add fixed supply in dts files.
> > If reset-gpios could be added in this schema then we could include
> > oristech panel here.
> 
> Does this patch has been merged ?

I was sidetracked by other things.
Maybe you can move it forward?

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
