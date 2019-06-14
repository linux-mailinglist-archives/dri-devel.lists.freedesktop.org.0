Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FD545619
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B68E1898FD;
	Fri, 14 Jun 2019 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCAF892F2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 02:32:33 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 19so443364pfa.4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 19:32:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=Po2RPMC2YO1kfuno4F5znl/XLXzbNv7hZgPyyC5n0VE=;
 b=bkCGOqDQn6ibwiY4QzKfMx9FLtUE/sQ+gEvIf8Z2wVLRFIBgmSsvxmL+RE9JPHrLc+
 pUTuEdWbA0u0cEUJdHiTz133nk0whjK+HA6/4/0SAgz/Wn1Zvlv94BpV944DOF0IlpZd
 aJP6zE5RyWsoP60qbJTDTok+hPO8SUIA9UZd/Lx9hR32s1HsugntiacTsyUX1qTzKhWn
 wQgYQ9lhXhvmfXi8yO0aXDpu/i1RsM+vZscSZCwqBH+mGjrRNcqz2pIpvB4kaHS5CNW/
 yNYR5Q4Dh34N1PP/NhdyM7Utjeub/fFtEfoFJvtfppi3k6aBTQ1rxh5P13el6xo3DDNK
 EcXg==
X-Gm-Message-State: APjAAAVoJ09wIDZMcPbcjkFViJw5xboFv5fhlR2rNqUG1Z2MLYr7j9WK
 l14Y8VCGehHlQsp6U2OjilQ=
X-Google-Smtp-Source: APXvYqyg7Mk8RiPSvWKZy1fhd/L5/sfeY1xok8PLV93AhLV+v449B9jYYij1sjbXhwdBfCChBeFH/Q==
X-Received: by 2002:a63:545a:: with SMTP id e26mr33069331pgm.162.1560479551359; 
 Thu, 13 Jun 2019 19:32:31 -0700 (PDT)
Received: from t-1000 (c-98-210-58-162.hsd1.ca.comcast.net. [98.210.58.162])
 by smtp.gmail.com with ESMTPSA id h12sm1362648pje.12.2019.06.13.19.32.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 19:32:30 -0700 (PDT)
Date: Thu, 13 Jun 2019 19:32:28 -0700
From: Shobhit Kukreti <shobhitkukreti@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH] staging: fbtft: Fix checkpatch ERROR: space prohibited
 before that close parenthesis ')'
Message-ID: <20190614023225.GA27938@t-1000>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:22:30 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent;
 bh=Po2RPMC2YO1kfuno4F5znl/XLXzbNv7hZgPyyC5n0VE=;
 b=DnfW7CRaxue2mTMzURxVYRxgqmgUc8/JumpQo590jGbccOT30UT/5fkwbE3yWrie7Y
 eSB9wxkx/g+ye3AKrETSi4fRkUg4aCE+MZCNEAjmsFZRIwRkdwyft3jxVido9qNV5z7d
 D6ARrSwL7sPjhaK2BZROPTpWMwsPBFuV2j44n9TJAKmMO55txDvJ5lxOkuIWWPzNN3Cr
 HsqvwQe5fJ+T/Dqg02EdNJ5yKv7vzWcefkY5NQ0f9SBOULJLItfVu4wXml06a/oDbrBj
 1SIF3zQM3ROndu6UopZxtgIHvTVRORKune9xGP3KfHJr5cNL6SYVjJ5MZSsYUDzFyjdx
 +KHg==
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
Cc: shobhitkukreti@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2xlYW5lZCB1cCBjb2RlIHRvIHJlc29sdmUgIHRoZSBjaGVja3BhdGNoIGVycm9yCkVSUk9SOiBz
cGFjZSBwcm9oaWJpdGVkIGJlZm9yZSB0aGF0IGNsb3NlIHBhcmVudGhlc2lzICcpJwpmcm9tIHRo
ZSBmaWxlOgoKZmJ0ZnQvZmJ0ZnQtYnVzLmMKClNpZ25lZC1vZmYtYnk6IFNob2JoaXQgS3VrcmV0
aSA8c2hvYmhpdGt1a3JldGlAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9m
YnRmdC1idXMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtYnVz
LmMgYi9kcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtYnVzLmMKaW5kZXggMmVhODE0ZC4uMmI0
M2JjMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWJ1cy5jCisrKyBi
L2RyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRmdC1idXMuYwpAQCAtNjIsOSArNjIsOSBAQCBvdXQ6
CQkJCQkJCQkJICAgICAgXAogfSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogRVhQT1JUX1NZTUJPTChm
dW5jKTsKIAotZGVmaW5lX2ZidGZ0X3dyaXRlX3JlZyhmYnRmdF93cml0ZV9yZWc4X2J1czgsIHU4
LCB1OCwgKQorZGVmaW5lX2ZidGZ0X3dyaXRlX3JlZyhmYnRmdF93cml0ZV9yZWc4X2J1czgsIHU4
LCB1OCwpCiBkZWZpbmVfZmJ0ZnRfd3JpdGVfcmVnKGZidGZ0X3dyaXRlX3JlZzE2X2J1czgsIF9f
YmUxNiwgdTE2LCBjcHVfdG9fYmUxNikKLWRlZmluZV9mYnRmdF93cml0ZV9yZWcoZmJ0ZnRfd3Jp
dGVfcmVnMTZfYnVzMTYsIHUxNiwgdTE2LCApCitkZWZpbmVfZmJ0ZnRfd3JpdGVfcmVnKGZidGZ0
X3dyaXRlX3JlZzE2X2J1czE2LCB1MTYsIHUxNiwpCiAKIHZvaWQgZmJ0ZnRfd3JpdGVfcmVnOF9i
dXM5KHN0cnVjdCBmYnRmdF9wYXIgKnBhciwgaW50IGxlbiwgLi4uKQogewotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
