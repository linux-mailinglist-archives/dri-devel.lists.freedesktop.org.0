Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF294DAC59
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 09:21:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA5C10E194;
	Wed, 16 Mar 2022 08:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3B7510E339
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 08:21:12 +0000 (UTC)
Date: Wed, 16 Mar 2022 08:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1647418870;
 bh=zRwWsMDd5Kf2yQpedEA3Ka2dLpgNvYvwuOL0uYq4mxY=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
 References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID;
 b=PFi5oUndJiaNCWpucKE20V6s42xrgKqVc18zwG8poOp0/P8PDV18EhlmedA+/Da1I
 vxDsMTpq4e881iy/N0sPDi0J0UPC6XzV6ib7AEOLfcZTAWTcWQuADH3IBzwFDcpr3h
 rNFbvWU3+DElh/ctn7BtoKDCO+yPKHc/d/2MSF2qDiQ4jPw8tt3lxwg7mpJnv6tbci
 iwmWf0+0298vqsSWlDgfD2K4a5ue+dulPQO+MFN5Jyw7P8LqKJK2mDg2pfm0ICSj5d
 o7tv6vx8JacJX0hFUewxRzmJSEvPQSrf1D+3fIyOeythdax8tvpnGCb98oB2QOp9A1
 cLOv5jrVfJkbw==
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/blend: fix typo in the comment
Message-ID: <BIZcpVXorgU67k6Z1BWkW55hvkl-GnnFE00SXDzlZJbgnDc155O22HLlSGogXevppb6bFVNF0tmRggSIVclySa-fR8QjnPM7-mhAYxk61Nw=@emersion.fr>
In-Reply-To: <20220316074648.7009-1-dmitry.baryshkov@linaro.org>
References: <20220316074648.7009-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Simon Ser <contact@emersion.fr>
