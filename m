Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63281BF9895
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 02:52:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E7F10E071;
	Wed, 22 Oct 2025 00:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 446 seconds by postgrey-1.36 at gabe;
 Wed, 22 Oct 2025 00:52:51 UTC
Received: from outbound404.service-now.com (outbound404.service-now.com
 [149.96.5.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFA010E071
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 00:52:51 +0000 (UTC)
Received: from outbound27.service-now.com (unknown [10.248.2.211])
 by outbound404.service-now.com (Postfix) with ESMTPS id 6B6A5EDA0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 17:45:25 -0700 (PDT)
Received: from app135015.ytz201.service-now.com (unknown [10.248.2.236])
 by outbound27.service-now.com (Postfix) with ESMTP id 359846000099;
 Tue, 21 Oct 2025 17:45:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 outbound27.service-now.com 359846000099
Date: Tue, 21 Oct 2025 17:45:24 -0700 (PDT)
From: Red Hat Product Security <secalert@redhat.com>
To: ian.forbes@broadcom.com, rkeshri@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, security@redhat.com,
 dri-devel@lists.freedesktop.org, maaz.mombasawala@broadcom.com,
 zack.rusin@broadcom.com
Message-ID: <1455314725.24247.1761093924208@app135015.ytz201.service-now.com>
Subject: Re: [PATCH] drm/vmwgfx: Validate command header size against
 SVGA_CMD_MAX_DATASIZE
MIME-Version: 1.0
Content-Type: multipart/mixed; 
 boundary="----=_Part_24245_133645412.1761093924207"
X-ServiceNow-Source: Notification-ec04d32213ede300196f7e276144b04e
X-ServiceNow-SysEmail-Version: 2
Precedence: bulk
Auto-Submitted: auto-generated
X-ServiceNow-Generated: true
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Reply-To: Red Hat Product Security <secalert@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

------=_Part_24245_133645412.1761093924207
Content-Type: multipart/alternative; 
	boundary="----=_Part_24246_1462613792.1761093924207"

------=_Part_24246_1462613792.1761093924207
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8

Hello!

INC3829670 ([PATCH] drm/vmwgfx: Validate command header size against SVGA_CMD_MAX_DATASIZE) has been updated.

Opened for: ian.forbes@broadcom.com
Followers: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com, maaz.mombasawala@broadcom.com, security@redhat.com, ian.forbes@broadcom.com, Rohit Keshri

A Guest updated your request with the following comments:

Reply from: security@redhat.com
 View email thread

How can I track and update my request?

To respond, reply to this email. You may also create a new email and include the request number (INC3829670) in the subject.

Thank you,
Product Security

Ref:MSG112485768
------=_Part_24246_1462613792.1761093924207
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div><p style="margin-top:0;margin-bottom:10px;">Hello!</p><p style="margin-top:0;margin-bottom:10px;">INC3829670 ([PATCH] drm/vmwgfx: Validate command header size against SVGA_CMD_MAX_DATASIZE) has been updated.</p><p style="margin-top:0;margin-bottom:10px;">Opened for:&nbsp;ian.forbes@broadcom.com<br>Followers:&nbsp;dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com, maaz.mombasawala@broadcom.com, security@redhat.com, ian.forbes@broadcom.com, Rohit Keshri</p></div>
<p style="margin-top: 10px; margin-bottom: 10px;">A Guest updated your request with the following comments:</p>
<div style="padding: 10px 0 10px 10px; background-color: ivory;"><div>Reply from: security@redhat.com</div><div>&nbsp;</div><div><details style="display: inline;"><summary style="cursor: pointer; font-weight: 900; font-family: Verdana, sans-serif; font-size: 11px;">View email thread</summary></details></div></div>
<div><p style="margin-top:20px;margin-bottom:10px;"><strong>How can I track and update my request?</strong></p><p style="margin-top:0;margin-bottom:10px;">To respond, reply to this email. You may also create a new email and include the request number (INC3829670) in the subject.</p></div>
<p style="margin-top: 14px; margin-bottom: 0;">Thank you,<br>Product Security</p><div>&nbsp;</div><div style="display:inline">Ref:MSG112485768</div></body></html>
------=_Part_24246_1462613792.1761093924207--

------=_Part_24245_133645412.1761093924207--
