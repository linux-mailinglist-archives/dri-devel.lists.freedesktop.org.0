Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D51F2F74BA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D21A56E328;
	Fri, 15 Jan 2021 08:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 626 seconds by postgrey-1.36 at gabe;
 Fri, 15 Jan 2021 08:10:14 UTC
Received: from comms.puri.sm (comms.puri.sm [159.203.221.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B54389973
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 08:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by comms.puri.sm (Postfix) with ESMTP id 936E4DF477;
 Thu, 14 Jan 2021 23:59:47 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
 by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rFSU89Uq-WvI; Thu, 14 Jan 2021 23:59:46 -0800 (PST)
From: Martin Kepplinger <martin.kepplinger@puri.sm>
To: laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH v2 1/7] dt-bindings: display: mxsfb: Convert binding to
 YAML
Date: Fri, 15 Jan 2021 08:59:18 +0100
Message-Id: <20210115075918.26407-1-martin.kepplinger@puri.sm>
In-Reply-To: <20201007012438.27970-2-laurent.pinchart@ideasonboard.com>
References: <20201007012438.27970-2-laurent.pinchart@ideasonboard.com>
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
Cc: marex@denx.de, devicetree@vger.kernel.org, agx@sigxcpu.org,
 Martin Kepplinger <martin.kepplinger@puri.sm>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi Laurent,

Do you mind me adding a DT property in the old format now? If so, I'd
appreciated an ack in this thread:
https://lore.kernel.org/linux-arm-kernel/20201201134638.GA305734@bogon.m.sigxcpu.org/

If it causes extra work for you and want to resend your series soon, I'll
gladly delay them for later.

thanks,
                                       martin
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
