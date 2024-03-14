Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6833A87BB08
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 11:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BDD10E213;
	Thu, 14 Mar 2024 10:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V7wtY5KK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA76510E213
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 10:12:51 +0000 (UTC)
Received: from ideasonboard.com (unknown
 [IPv6:2001:b07:5d2e:52c9:cc1e:e404:491f:e6ea])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0717675;
 Thu, 14 Mar 2024 11:12:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710411146;
 bh=+eHS2rKe70PuRbJnY07cW0cCXhsjiiln12b2PllfoTw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=V7wtY5KKxQVqSfRbMjruIj5J3JdBR5ze9p68w893V1XtIFHHk+AFCPAgA9S4bssEB
 ZtgO/S0ValK3U4qT4S/YYLDnfeV+m+yv2Tt5kdabm68Cn2eqbE3OXLkaKFdQxo1No+
 WX4tsRhOUn3Femw2OCj7Y+Xp2nSIuonqQy7sZmQQ=
Date: Thu, 14 Mar 2024 11:12:47 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Naushir Patuck <naush@raspberrypi.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 libcamera-devel@lists.libcamera.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/2] drm/fourcc.h: Add libcamera to Open Source Waiver
Message-ID: <7frycd5jnd674cily3xz3p2yl2bjc2yrn3z6sw3dzqdpl4widp@hrgyml6b7vh5>
References: <20240228102245.80469-1-jacopo.mondi@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240228102245.80469-1-jacopo.mondi@ideasonboard.com>
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

Hello

gentle nudge for

*) libcamera: are we ok being listed here ?
*) DRM/KMS: is it ok splitting the list of projects in the way I've
   done ?

Thanks
   j

On Wed, Feb 28, 2024 at 11:22:42AM +0100, Jacopo Mondi wrote:
> As suggested by Sima, add libcamera to the list of projects to which the
> Open Source Waiver notice applies.
>
> To maintain the paragraph readable, make a list out of the projects to which
> such notice applies.
>
> Jacopo Mondi (2):
>   drm/fourcc.h: List of Open Source Waiver projects
>   drm/fourcc.h: Add libcamera to Open Source Waiver
>
>  include/uapi/drm/drm_fourcc.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>
> --
> 2.43.2
>
