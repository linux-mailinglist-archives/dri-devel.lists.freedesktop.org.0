Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E70836FCE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 11:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0687F893B9;
	Thu,  6 Jun 2019 09:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75632893B9
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 09:27:07 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E37BE8051D;
 Thu,  6 Jun 2019 11:27:04 +0200 (CEST)
Date: Thu, 6 Jun 2019 11:27:03 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 04/10] dt-bindings: display: renesas: lvds: Add
 renesas, companion property
Message-ID: <20190606092703.GA17442@ravnborg.org>
References: <20190528141234.15425-1-laurent.pinchart+renesas@ideasonboard.com>
 <20190528141234.15425-5-laurent.pinchart+renesas@ideasonboard.com>
 <20190528163730.GA9610@ravnborg.org>
 <20190528164916.GA17874@pendragon.ideasonboard.com>
 <20190528165900.GA10262@ravnborg.org>
 <20190606075435.GD4931@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190606075435.GD4931@pendragon.ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=XN0FE8mA5ZG9_mJlrPoA:9 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19
 a=CjuIK1q_8ugA:10
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
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudC4KCj4gPiAKPiA+IFRoZSBtYWluIGRpZmZlcmVuY2UgaXMgIndoZW4gZHVhbC1s
aW5rIG1vZGUgaXMgc3VwcG9ydGVkIi4KPiA+IEFzIHBlciBteSB1bmRlcnN0YW5kaW5nIHRoaXMg
cHJvcGVydHkgaXMgb25seSByZWxldmFudCB3aGVuIHRoZSBhY3R1YWwKPiA+IEhXIHN1cHBvcnRz
IC8gdXNlcyBkdWFsLWxpbmsgbW9kZS4KPiA+IFNvIGZvciBhIGJvYXJkIHRoYXQgZG8gbm90IGV2
ZW4gd2lyZSB1cCBkdWFsLWxpbmssIHRoZW4gc2V0dGluZyB0aGUKPiA+IHByb3BlcnR5IHdvdWxk
IGJlIGNvbmZ1c2luZy4KPiAKPiBUaGF0J3Mgbm90IHF1aXRlIGNvcnJlY3QuIFRoZSBwcm9wZXJ0
eSBzaGFsbCBiZSBzcGVjaWZpZWQgd2hlbiB0aGUgU29DCj4gc3VwcG9ydHMgZHVhbC1saW5rIG1v
ZGUgKHdoaWNoIGlzIHRoZSBjYXNlIGZvciB0aGUgRDMgYW5kIEUzIFNvQ3Mgb25seSksCj4gcmVn
YXJkbGVzcyBvZiB3aGV0aGVyIHRoZSBib2FyZCBpcyB3aXJlZCB1cCBpbiBzaW5nbGUtbGluayBv
ciBkdWFsLWxpbmsKPiBtb2RlLiBTZWxlY3Rpb24gb2YgdGhlIG1vZGUgaXMgcGVyZm9ybWVkIGF0
IHJ1bnRpbWUgYnkgbG9va2luZyBhdCB0aGUKPiByZXF1aXJlbWVudHMgb2YgdGhlIExWRFMgc2lu
aywgbm90IGJhc2VkIG9uIHRoZSBjb21wYW5pb24gcHJvcGVydHkgaW4KPiBEVC4gVGhlIHJlbmVz
YXMsY29tcGFuaW9uIHByb3BlcnR5IGlzIHRodXMgU29DLXNwZWNpZmljLCBidXQgbm90Cj4gYm9h
cmQtc3BlY2lmaWMuClRoYW5rcyBmb3IgdGFraW5nIHlvdXIgdGltZSB0byBjbGFyaWZ5IHRoaXMu
CgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
