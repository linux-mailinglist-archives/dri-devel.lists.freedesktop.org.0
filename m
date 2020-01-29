Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DE014D0BC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jan 2020 19:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24EC56F615;
	Wed, 29 Jan 2020 18:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24CAA6F615
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jan 2020 18:54:58 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 549B92004B;
 Wed, 29 Jan 2020 19:54:56 +0100 (CET)
Date: Wed, 29 Jan 2020 19:54:55 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Subject: Re: [PATCH 0/2] Add support for EDT ETM043080DH6-GP
Message-ID: <20200129185455.GC25273@ravnborg.org>
References: <1580317318-32071-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580317318-32071-1-git-send-email-marian-cristian.rotariu.rb@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=ppht2Jg_3bj4CcCLAtYA:9 a=CjuIK1q_8ugA:10
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
Cc: Chris Paterson <chris.paterson2@renesas.com>,
 prabhakar.mahadev-lad.rj@bp.renesas.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marian-Cristian.

On Wed, Jan 29, 2020 at 05:01:56PM +0000, Marian-Cristian Rotariu wrote:
> This small patch-set adds support for EDT ETM043080DH6-GP. This is a
> 480x272 TFT Display with capacitive touchscreen and it is compatible with
> simple panel driver.
> 
> We have tested it with our iWave-G22D Generic SODIMM Development Board.
> 
> Marian-Cristian Rotariu (2):
>   dt-bindings: display: Add bindings for EDT panel
>   drm/panel: simple: Add EDT panel support

Thanks for your patches. I have commented on the individual patches.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
