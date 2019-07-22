Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8F570ABB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 22:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A517789EB7;
	Mon, 22 Jul 2019 20:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1564189EB4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 20:33:06 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:52600 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hpezY-007WZT-9g; Mon, 22 Jul 2019 16:33:04 -0400
Subject: Re: [PATCH v2 9/9] MAINTAINERS: Remove tinydrm entry
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190722104312.16184-1-noralf@tronnes.org>
 <20190722104312.16184-10-noralf@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <ab5a59ff-e14c-02e4-8e33-3a22fc355f1b@lechnology.com>
Date: Mon, 22 Jul 2019 15:33:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190722104312.16184-10-noralf@tronnes.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0lUGFvMjp6lY3Suvv7T27CQLV2jGcbpTqgDmEIbZwD8=; b=O0sg613bW/fYG++dyeLVo0bHe1
 F3dw8jFEVRYwHTySwtdJWzFzKwu97EUwheVkxTdvRr3nvvRgzNUtGkC13dqcw3BACuTe/7hNPdN2H
 KUOCbOfR5bFzovA/BT+Uiz18UD0Qo6eMysTIiwXuqA3fOZeSrniY/LezOjGdY92XqQWnJxx4Kz0Cx
 /mN2RfWIchMPqpyUYl2gXrx0Svf2m4PJQRFXPLYQ/W1EHWkfXokFXf3euLYDczpVb7a6MzHkEMUtN
 +Gh95dwpl5g4Q2U2UzxujRAzhZiUlpRLUjyRu6tzx0H/FRFKr2ssge6MqBd+r4o52AAQCRuwmkUn8
 TxDaNRTg==;
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: sam@ravnborg.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yMi8xOSA1OjQzIEFNLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gdGlueWRybSBpcyBq
dXN0IGEgY29sbGVjdGlvbiBvZiB0aW55IGRyaXZlcnMgbm93Lgo+IEFkZCBUOiBkcm0tbWlzYyBl
bnRyeSBmb3IgdGlueWRybSBkcml2ZXJzIHRoYXQgbGFja3MgaXQuCj4gCj4gQ2M6IERhdmlkIExl
Y2huZXIgPGRhdmlkQGxlY2hub2xvZ3kuY29tPgo+IFJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcg
PHNhbUByYXZuYm9yZy5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogTm9yYWxmIFRyw7hubmVzIDxub3Jh
bGZAdHJvbm5lcy5vcmc+Cj4gLS0tCgpBY2tlZC1ieTogRGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVj
aG5vbG9neS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
