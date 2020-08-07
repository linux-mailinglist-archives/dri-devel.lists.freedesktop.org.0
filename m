Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA99523E9A6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 10:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0D26E14A;
	Fri,  7 Aug 2020 08:59:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7997B6E14A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 08:59:47 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 6150C20028;
 Fri,  7 Aug 2020 10:59:44 +0200 (CEST)
Date: Fri, 7 Aug 2020 10:59:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: DRM/KMS experimental drivers for HiKey 970
Message-ID: <20200807085943.GA966139@ravnborg.org>
References: <20200805105137.2b272efc@coco.lan>
 <CALAqxLV_8phvdvezZV39sumS=D42+cZdfxCrCz6ht6eia8totQ@mail.gmail.com>
 <20200807092418.57843051@coco.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200807092418.57843051@coco.lan>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=xg7GN-GiWiMW0uS_oiwA:9 a=CjuIK1q_8ugA:10
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>, mani@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro.

> 
> I know. What can be done is to send a diff at patch 00/xx with
> the entire history for each driver folded, in order to easy
> for reviewers.
Personnaly this would be preferred as I assume the history is a lot of
forth and back rather than incremental logical changes.

No promises of any useful reviews though...

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
