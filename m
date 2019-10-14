Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C139D6B1C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 23:14:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F426E320;
	Mon, 14 Oct 2019 21:14:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B10AD6E1C4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 21:14:07 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-4AaFgcRZPxGUiJufDS-XUA-1; Mon, 14 Oct 2019 17:14:04 -0400
Received: by mail-qk1-f198.google.com with SMTP id n135so18114284qke.23
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 14:14:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=LbFOhj2iV6JJmdZr9t9v+6z/c4zH5yur3zOQj5gMCis=;
 b=m8osZHg3C/st83CS27KGUBsy3Fk+2vVi/zg09CmCzHjLtznRV+bJQDDo+ba6HV6jOU
 ENLxO47xWdfpqkcH9/hRIdz3hXPOA8zC4pK3DLIz20Zr5FLA45t1j2u9UAGl6OQxQofE
 +Yf5vFSvXb2DeeoyddUHTEsyk70cSvjZsWXqdC0qzcJlBMTeyeDxEaVc6n1MAqzLWXpV
 TxekGBrtF8RxbpdADYXiYy1D9Uxnk0zbV9Ap1AU9Q8GL9jECRRkPcDJwfxNF5jpQ0soD
 Lm+YSn6qmO9ssS17/rgXQiB824AQoQAgn3Em69bCDyYPUICSXOT4rdQpHfLEh4abZm4j
 lyvQ==
X-Gm-Message-State: APjAAAX8vfC+9siuDkq0jZJQ55fATLTZVi9Hc3Kxr3STvOxZD9WxHhaH
 TlPqyE/drmFRZ4DxHIGi5PCfsWBCc1Se/KnqNYJwEwIxuS/bI06mkwjZpOXH+qajQz16EdkdDXk
 477GEqr5hitNmmSX3lVPVRqmAb6Pc
X-Received: by 2002:a0c:e6a6:: with SMTP id j6mr32580292qvn.74.1571087643832; 
 Mon, 14 Oct 2019 14:14:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwpyrq2JxiDyjP3NFmeNOqhT2ajF1qqd5Ni3GWoqykpEn01szX3VQX8L8MelUgDJUpO61MTvg==
X-Received: by 2002:a0c:e6a6:: with SMTP id j6mr32580273qvn.74.1571087643470; 
 Mon, 14 Oct 2019 14:14:03 -0700 (PDT)
Received: from malachite.lyude.net
 (static-173-76-190-23.bstnma.ftas.verizon.net. [173.76.190.23])
 by smtp.gmail.com with ESMTPSA id o38sm11126930qtc.39.2019.10.14.14.14.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 14:14:02 -0700 (PDT)
Message-ID: <ac54b1a7f9270972bd13674f6fe362c92b429445.camel@redhat.com>
Subject: Anyone interested in CoC training courtesy of X.Org?
From: Lyude Paul <lyude@redhat.com>
To: dri-devel <dri-devel@lists.freedesktop.org>, xorg-devel
 <xorg-devel@lists.x.org>, events@lists.x.org,
 mesa-dev@lists.freedesktop.org,  "wayland-devel@lists.freedesktop.org"
 <wayland-devel@lists.freedesktop.org>, "members@x.org" <members@x.org>, 
 "X.Org Foundation Board" <board@foundation.x.org>
Date: Mon, 14 Oct 2019 17:14:01 -0400
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: 4AaFgcRZPxGUiJufDS-XUA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1571087646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=CYAlrKUHJg5GTLx3oS8cnjzs2H4w9zCSjkFH4Snl9mE=;
 b=ivgSFzqhuIir+aJvq5g1QD1kqGfxWDot/ce1eOYcAgKDPPEe2eQ+EdfXSqRiEtjq9526Sn
 /Mn/CPyFZuH/mnkXA5jdRbE3KO0a4Iu7ivCLubKBGJDLJxlOtrloxQbErFWnQBWZCE22sl
 kbKc2edT8yETUYVSBhWCV5M/ap9Syzs=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhIFRoaXMgeWVhciB3ZSBkZWNpZGVkIHRvIHN0YXJ0IHB1dHRpbmcgbWVtYmVycyBvZiB0aGUg
Q29DIHRlYW1zIGZvciBYb3JnCmFuZCBYREMgdGhyb3VnaCBjb2RlIG9mIGNvbmR1Y3QgdHJhaW5p
bmcsIHBhaWQgZm9yIGJ5IHRoZSBYLk9yZyBmb3VuZGF0aW9uIGFuZApydW4gYnkgT3R0ZXIgVGVj
aDoKCmh0dHBzOi8vb3R0ZXIudGVjaG5vbG9neS9jb2RlLW9mLWNvbmR1Y3QtdHJhaW5pbmcvCgpU
aGUgdHJhaW5pbmcgZ29lcyBvdmVyIHByYWN0aWNpbmcgdGFraW5nIGluY2lkZW50IHJlcG9ydHMs
IGZvbGxvd2luZyB1cCB3aXRoCnJlcG9ydGVycywgZGlzY3Vzc2lvbiBvbiBpc3N1ZXMgc3VjaCBh
cyBtaWNyb2FnZ3Jlc3Npb25zIGFuZCBwZXJzb25hbApjb25mbGljdHNsLCBhbmQgZnJhbWV3b3Jr
cyBmb3IgZXZhbHVhdGluZyByZXNwb25zZXMgdG8gcmVwb3J0cy4KCkhhdmluZyBnb25lIHRocm91
Z2ggdGhlIHRyYWluaW5nIG15c2VsZiwgSSBjYW4gZGVmaW5pdGVseSBJIGxlYXJuZWQgcXVpdGUg
YQpiaXQgZnJvbSBpdCBhbmQgd291bGQgaGlnaGx5IHJlY29tbWVuZCB0aGlzIHRvIG90aGVycyB3
aG8gYXJlIHBsYW5uaW5nIG9uCm1vZGVyYXRpbmcgY29tbXVuaXRpZXMuIFNvIHNpbmNlIHdlIGhh
dmUgdGhlIHJlc291cmNlcyB0byBwdXQgbW9yZSBYb3JnCm1lbWJlcnMgdGhyb3VnaCB0cmFpbmlu
ZyB3ZSBhcmUgY29uc2lkZXJpbmcgdGhlIGlkZWEgb2Ygc3BvbnNvcmluZyBvdGhlciBYb3JnCm1l
bWJlcnMgdG8gZ28gdGhyb3VnaCB0aGlzIHRyYWluaW5nIGFzIHdlbGwsIHNpbmNlIHRoaXMgc2Vl
bWVkIHRvIGdhcm5lciBhCmRlY2VudCBhbW91bnQgb2YgaW50ZXJlc3QgZHVyaW5nIFhEQy4gU28s
IEknbSBnb2luZyBhcm91bmQgYW5kIHBva2luZyBhIGZldwpkaWZmZXJlbnQgcHJvamVjdHMgdG8g
ZmlndXJlIG91dCB3aG8gYWxsIHdvdWxkIGJlIGludGVyZXN0ZWQgaW4gc3VjaCB0cmFpbmluZy4K
SWYgdGhlcmUncyBhbnkgdGFrZXJzLCBvciBhbnlvbmUgaGFzIGFueSBxdWVzdGlvbnMsIGZlZWwg
ZnJlZSB0byByZXNwb25kIGFuZApsZXQgdXMga25vdyEgCi0tIApDaGVlcnMsCglMeXVkZSBQYXVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
