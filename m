Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C573AEC959
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2019 21:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE196E301;
	Fri,  1 Nov 2019 20:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAFB6E301
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2019 20:06:48 +0000 (UTC)
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-xTaRBZIhPnyNswbCP9kQxQ-1; Fri, 01 Nov 2019 16:06:45 -0400
Received: by mail-qk1-f200.google.com with SMTP id 125so10333964qkj.12
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2019 13:06:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:organization
 :user-agent:mime-version:content-transfer-encoding;
 bh=T0uidzvnSOYOIyqMlnQPdQRM6HckHVeBK/+Gw1LVgoc=;
 b=fm/crUzhbhhc0nNVCiKPxH9sXmYcOZr2/rUvP3/LZbaqO8GyK+IyX+2BwfRELrtr3+
 w4f4lalVA1fGIGRDz+OQ89Ozo2kaACERMkDHJqjcvfwMzUrCjHv0cT3YCUffToW+exZr
 qK0HNjy24potXgoeWyfn23YFiIkB4kc3IhxOmZggTODe4beIRZIBg9O1GiKuGGzGIw9T
 6IEU487netFwiBNEWcnoiRRR8tZKmn9UTQi7dBBGMGUcl/e9QIO4GQyGD6QEqjHGrXJY
 1KIrhTN8jytOsOAtEupIpU8Yh6JtXv/9MNYFTXEIKVZ+wcdHZ3EiAen+dM24yfowh0g+
 FNZg==
X-Gm-Message-State: APjAAAUs3kGqK+WvI7KUIluX2RpmiZkIm6f3qqPCG7NMKthIM88FeKOY
 MDdjxPlzacCEpSGPDgcxdZOMIp0t+tx5At/fNeRwvXcr8EhBk2TDBnBHO+yOHfk16lkoJiSPhmK
 Es0jjNZ25wP3/gtgf2W1tqr/Faj85
X-Received: by 2002:ac8:6a04:: with SMTP id t4mr1203932qtr.37.1572638804200;
 Fri, 01 Nov 2019 13:06:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNSOfgqDMYNbamEmlFYFB8GSv+3Bq/jbE8/WSmF2D5uk3m9IYE7IszplOMqJoINO5ly82u0A==
X-Received: by 2002:ac8:6a04:: with SMTP id t4mr1203915qtr.37.1572638804015;
 Fri, 01 Nov 2019 13:06:44 -0700 (PDT)
Received: from dhcp-10-20-1-46.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id c204sm4092436qkb.90.2019.11.01.13.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2019 13:06:42 -0700 (PDT)
Message-ID: <91aa24ed23e2b8c012ec43ef9eb5baed2532f96c.camel@redhat.com>
Subject: Individuals interested in VESA memberships?
From: Lyude Paul <lyude@redhat.com>
To: "members@x.org" <members@x.org>, xorg-devel@lists.x.org, dri-devel
 <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>
Date: Fri, 01 Nov 2019 16:06:40 -0400
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: xTaRBZIhPnyNswbCP9kQxQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572638807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xRjJf6mDuz5grOqzevKLN/DK88NMiYZAX/hKIofKo8s=;
 b=AGJFSja+7GJxoiCkzTvgy1390slMnRfp9QE/om/4IbH7wV2JSnRodx/m1KK0QQ7BuYDJtG
 fc1GYhi7mJSwEz2AV4/vukneMk6s4obgufR+VfyhXGmXSTCO+BiWv96YHoG3Olh/sGd38w
 j2H+WqSE9lK0DdPEaGqreZdM3tNkw0k=
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
Cc: "X.Org Foundation Board" <board@foundation.x.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhIFJlY2VudGx5IEkndmUgYmVlbiB3b3JraW5nIHdpdGggdGhlIHJlc3Qgb2YgdGhlIFguT3Jn
IGJvYXJkIHRvIHRyeSB0byBnZXQKWC5vcmcgYWNjZXNzIHRvIFZFU0EgbWVtYmVyc2hpcHMgc28g
dGhhdCBjb250cmlidXRvcnMgdGhhdCBkb24ndCBoYXZlIGFuCmVtcGxveWVyIHdobyBpcyBhYmxl
L3dpbGxpbmcgdG8gam9pbiBWRVNBIGNhbiBwb3RlbnRpYWxseSBnZXQgYWNjZXNzIHRvIHRoZQp2
YXJpb3VzIGJlbmVmaXRzIG9mIGEgVkVTQSBtZW1iZXJzaGlwLCBzdWNoIGFzIGFjY2VzcyB0byBE
aXNwbGF5UG9ydApzcGVjaWZpY2F0aW9ucy4gU2luY2UgSSBuZWVkIHRvIGdhdGhlciBhIGxpc3Qg
b2YgaW50ZXJlc3RlZCBYLm9yZyBtZW1iZXJzLCBJJ2QKbGlrZSB0byBrbm93IHdobyBhbGwgbWln
aHQgYmUgaW50ZXJlc3RlZCBpbiBhIG1lbWJlcnNoaXAgbGlrZSB0aGlzLiBUaGVyZSBhcmUKbm8g
Y29zdHMgaW52b2x2ZWQsIGFzIHRoZSBWRVNBIG1lbWJlcnNoaXAgd2UncmUgbG9va2luZyBhdCBp
biBwYXJ0aWN1bGFyIGNvbWVzCmF0IG5vIGNvc3QgdG8gdXMgc2luY2Ugd2UncmUgYSBub24tcHJv
Zml0LgoKVGhlIGN1cnJlbnQgcGxhbiBpcyB0byBleHRlbmQgVkVTQSBtZW1iZXJzaGlwIHRvIFgu
T3JnIG1lbWJlcnMgd2hvCnNwZWNpZmljYWxseSByZXF1ZXN0IGl0LiBJZiB5b3UgdGhpbmsgeW91
J2QgYmUgYXQgYWxsIGludGVyZXN0ZWQgaW4gdGhpcywgb3IKa25vdyBhbnkgcHJvamVjdHMgb3Ig
Y29udHJpYnV0b3JzIHdobyB3b3VsZCBiZSwgcGxlYXNlIGZlZWwgZnJlZSB0byByZXNwb25kIHRv
CnRoaXMgbWVzc2FnZSBhbmQgbGV0IG1lIGtub3chCi0tIApDaGVlcnMsCglMeXVkZSBQYXVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
