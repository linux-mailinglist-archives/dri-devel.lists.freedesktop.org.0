Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0823A2A33D
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2019 08:58:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E20346E148;
	Sat, 25 May 2019 06:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B7B6E148
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 06:58:43 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D564C20098;
 Sat, 25 May 2019 08:58:40 +0200 (CEST)
Date: Sat, 25 May 2019 08:58:39 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH] drm/panel: st7701: Swap vertical front and back porch
 timings
Message-ID: <20190525065839.GD9586@ravnborg.org>
References: <20190512184827.13905-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190512184827.13905-1-jagan@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=iP-xVBlJAAAA:8
 a=85sVP7tpRlSMwrdesq8A:9 a=CjuIK1q_8ugA:10 a=lHLH-nfn2y1bM_0xSXwp:22
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMTI6MTg6MjdBTSArMDUzMCwgSmFnYW4gVGVraSB3cm90
ZToKPiBWZXJ0aWNhbCBmcm9udCBhbmQgYmFjayBwb3JjaCB2YWx1ZXMgb24gZXhpc3RpbmcgZHJp
dmVyIGFyZSBzd2FwcGVkLgo+IFRoZSBleGlzdGluZyB0aW1pbmdzIGFyZSBzdGlsbCB3b3JraW5n
IGFzIGV4cGVjdGVkLCBidXQgdG8gbWFrZSBzdXJlIAo+IGl0IGNhbiBjb21wYXRpYmxlIHdpdGgg
dGVjaHN0YXIgdHM4NTUwYiBic3AgdGltaW5ncyB0aGlzIHBhdGNoIHN3YXAKPiB0aGUgc2FtZSB2
YWx1ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0
aW9ucy5jb20+CgpUaGFua3MsIGFwcGxpZWQuCgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
