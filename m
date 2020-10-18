Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368E729200F
	for <lists+dri-devel@lfdr.de>; Sun, 18 Oct 2020 23:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C806E8AC;
	Sun, 18 Oct 2020 21:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 070AC6E8AC
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Oct 2020 21:04:15 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 7108F20020;
 Sun, 18 Oct 2020 23:04:13 +0200 (CEST)
Date: Sun, 18 Oct 2020 23:04:12 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Kevin Brace <kevinbrace@gmx.com>
Subject: Re: It appears drm-next TTM cleanup broke something . . .
Message-ID: <20201018210412.GA515543@ravnborg.org>
References: <trinity-7bf82d9f-a022-48f3-bca0-d06eb28ebe35-1603048517864@3c-app-mailcom-bs08>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-7bf82d9f-a022-48f3-bca0-d06eb28ebe35-1603048517864@3c-app-mailcom-bs08>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=S433PrkP c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=cA6Gp-plZcH1Z8Z123kA:9 a=CjuIK1q_8ugA:10
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
Cc: Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kevin.

On Sun, Oct 18, 2020 at 09:15:17PM +0200, Kevin Brace wrote:
> As usual, I pulled in DRM repository code for an out of tree OpenChrome DRM repository a few days ago.

I know you have been working on and off on the openchrome driver for a
long time now. Any chance we will see the driver submitted for upstream soon?

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
