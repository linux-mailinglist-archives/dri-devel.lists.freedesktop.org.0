Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7145CA71E32
	for <lists+dri-devel@lfdr.de>; Wed, 26 Mar 2025 19:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BB210E1CF;
	Wed, 26 Mar 2025 18:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=mark.filion@collabora.com header.b="LeQ5Yyke";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 902 seconds by postgrey-1.36 at gabe;
 Wed, 26 Mar 2025 18:21:51 UTC
Received: from sender4-op-o16.zoho.com (sender4-op-o16.zoho.com
 [136.143.188.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C667E10E1E1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Mar 2025 18:21:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1743012407; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SqVl4fjP6AVf1voyAs8452K/qCf3cbq7QbvCO5o73vfmyEBuRTgzFqYmSGXsisasjssAa3rxr8VzLDuC9AznEAWx4XBLb/lYkubILrONzVUMZNSdwIjnWemr2gS4Z7nN90vkG21RCivEv7rFyjmCFAFyzipZypfwbABn8CFGum0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1743012407;
 h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=BrkHv+rZ6WIpMbgwux6DwS6T7KWS9TeddZtqalGUBV8=; 
 b=EoOjoDzM/Y1SaZWV2KFqhCfUcB6GdIctWZv/ZU+aUtzH4kYOrPNbt5JoOJsJQBmcVNrNomjeihUT/GOrW6ok2gDCv+hFBBurjF053AsVClKIPbywa5fdhVQPMnVAdR75bVF9mGPASOiX+SczI1/KBzi2Of5rpGIah+JOw2Q/T9s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=mark.filion@collabora.com;
 dmarc=pass header.from=<mark.filion@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743012407; 
 s=zohomail; d=collabora.com; i=mark.filion@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Date:Date:Content-Type:MIME-Version:Message-Id:Reply-To:Cc;
 bh=BrkHv+rZ6WIpMbgwux6DwS6T7KWS9TeddZtqalGUBV8=;
 b=LeQ5Yyke9jYvNKPnM5XRWJXWHtSTaSdh5rsjEN9TL9IFzWIuPeJc8XGquNgqFPio
 zvHrAYeX7nMGDm86t7LysT/qtQIxVdtzTDeTtXrPZqrm6Ezq51r2QRpYJm+zRp9aPLT
 HAH8Sc4I7tWzxm7+l/gapxxlk+7ymz7k9x1ghYAc=
Received: by mx.zohomail.com with SMTPS id 1743012405159191.22542825178948;
 Wed, 26 Mar 2025 11:06:45 -0700 (PDT)
Message-ID: <f9b102af0358484994a6f8f9d0c4f3bff1775d40.camel@collabora.com>
Subject: 2025 X.Org Foundation Membership deadline for voting in the
 upcoming election
From: Mark Filion <mark.filion@collabora.com>
To: dri-devel@lists.freedesktop.org
Date: Wed, 26 Mar 2025 14:06:44 -0400
Content-Type: multipart/alternative; boundary="=-rFbQqsnsgQfell9Zstvw"
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--=-rFbQqsnsgQfell9Zstvw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Now that the freedesktop server migration is almost done, it's time to
turn our attention on the 2025 X.Org Foundation elections, which are
rapidly approaching! We will be forwarding the election schedule and
nominating process to the membership shortly.

Please note that only current members can vote in the upcoming
election, and that the deadline for new memberships or renewals to vote
in the upcoming election is 23 April 2025 at 23:59 UTC.

If you are interested in joining the X.Org Foundation or in renewing
your membership, please visit the membership system site
at:=C2=A0https://members.x.org/

Mark Filion, on behalf of the X.Org elections committee

--=-rFbQqsnsgQfell9Zstvw
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0,=
 0, 0); font-family: Cantarell; font-style: normal; font-variant-caps: norm=
al; font-weight: 400; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px;=
 text-decoration: none;">Hello,</div><div style=3D"caret-color: rgb(0, 0, 0=
); color: rgb(0, 0, 0); font-family: Cantarell; font-style: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: s=
tart; text-indent: 0px; text-transform: none; white-space: normal; word-spa=
cing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-st=
roke-width: 0px; text-decoration: none;"><br></div><div style=3D"caret-colo=
r: rgb(0, 0, 0); color: rgb(0, 0, 0); font-family: Cantarell; font-style: n=
ormal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal;=
 text-align: start; text-indent: 0px; text-transform: none; white-space: no=
rmal; word-spacing: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -=
webkit-text-stroke-width: 0px; text-decoration: none;">Now that the freedes=
ktop server migration is almost done, it's time to turn our attention on th=
e 2025 X.Org Foundation elections, which are rapidly approaching! We will b=
e forwarding the election schedule and nominating process to the membership=
 shortly.</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0)=
; font-family: Cantarell; font-style: normal; font-variant-caps: normal; fo=
nt-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px=
; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-tap=
-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-=
decoration: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color=
: rgb(0, 0, 0); font-family: Cantarell; font-style: normal; font-variant-ca=
ps: normal; font-weight: 400; letter-spacing: normal; text-align: start; te=
xt-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0p=
x; -webkit-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-wid=
th: 0px; text-decoration: none;">Please note that only current members can =
vote in the upcoming election, and that the deadline for new memberships or=
 renewals to vote in the upcoming election is 23 April 2025 at 23:59 UTC.</=
div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-fami=
ly: Cantarell; font-style: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tran=
sform: none; white-space: normal; word-spacing: 0px; -webkit-tap-highlight-=
color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoration:=
 none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0,=
 0); font-family: Cantarell; font-style: normal; font-variant-caps: normal;=
 font-weight: 400; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; te=
xt-decoration: none;">If you are interested in joining the X.Org Foundation=
 or in renewing your membership, please visit the membership system site at=
:<span class=3D"Apple-converted-space">&nbsp;</span><a href=3D"https://memb=
ers.x.org/" style=3D"color: rgb(238, 238, 236);">https://members.x.org/</a>=
</div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); font-fa=
mily: Cantarell; font-style: normal; font-variant-caps: normal; font-weight=
: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-tap-highligh=
t-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; text-decoratio=
n: none;"><br></div><div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, =
0, 0); font-family: Cantarell; font-style: normal; font-variant-caps: norma=
l; font-weight: 400; letter-spacing: normal; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webki=
t-tap-highlight-color: rgba(0, 0, 0, 0.4); -webkit-text-stroke-width: 0px; =
text-decoration: none;">Mark Filion, on behalf of the X.Org elections commi=
ttee</div><div><span></span></div></body></html>

--=-rFbQqsnsgQfell9Zstvw--
