Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C7956994
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 14:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 873ED6E3F7;
	Wed, 26 Jun 2019 12:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04566E3F7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 12:43:37 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E3F5720042;
 Wed, 26 Jun 2019 14:43:35 +0200 (CEST)
Date: Wed, 26 Jun 2019 14:43:34 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: Add Sharp LS020B1DD01D
 panel documentation
Message-ID: <20190626124334.GD7337@ravnborg.org>
References: <20190603153120.23947-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603153120.23947-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8
 a=VwQbUJbxAAAA:8 a=1v-AF7XRe3pTpbPnbQEA:9 a=CjuIK1q_8ugA:10
 a=9LHmKk7ezEChjTCyhBa9:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDU6MzE6MThQTSArMDIwMCwgUGF1bCBDZXJjdWVpbCB3
cm90ZToKPiBUaGUgTFMwMjBCMUREMDFEIGlzIGEgMi4wIiAyNDB4MTYwIDE2LWJpdCBURlQgTENE
IHBhbmVsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxs
b3UubmV0Pgo+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgoKQWxs
IHBhdGNoZXMgYXBwbGllZCB0byBkcm0tbWlzYy1uZXh0IGFuZCBwdXNoZWQgb3V0LgpJIGhhZCBo
b3BlZCBmb3IgZmVlZGJhY2sgZm9ybSBvdGhlciBvbiB0aGUgdHJpY2sgd2l0aCBidXNfZm9ybWF0
cy4KQnV0IG5lb2l0aGVyIGlyYyBwaW5ncywgbm9yIG1haWxzIGdhdmUgYW55IHJlc3BvbnNlLgpT
byBJIGhhdmUgcHVzaGVkIGl0IG5vdy4KCglTYW0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
