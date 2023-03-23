Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC166C794F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 09:03:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A032210EB96;
	Fri, 24 Mar 2023 08:03:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4825410E43D;
 Thu, 23 Mar 2023 08:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ubX+nnzIxzDny+5k+G0pJbfcXie/ybrhPkiV40AdBmw=; b=c+i7uj8z3jWy25uAUAR45qnaaT
 pF3tyH/ZjP0wTJjtmbOrXnGcW4sql3YaYj6MZSogbloXIZVITUnYxaEhkdkdZGfF44hUx6SPaE9a0
 xBQfiNtm13EsVbjmnrxvpKZ+GhK4HcE6JamresuAMIAPDpsNnMQfN/c2qbLJncaZW+HRMBbuEnUQn
 WlMCQ33hqkQvD8SOdim8Co2aWJXy8H4SUHJsokyAPRKKsuO/m5UFp9AoLoRdsC3NEs7XRMY+IVarW
 NHQUKY0C6P2v9a3OIKypXSqH242vPOXOEd29Ql/vyVbl5+O5iKbzPF1BxoBOL+V7KjlBNHfCp9yYW
 FqQ8q7Xg==;
Received: from 137.red-83-52-2.dynamicip.rima-tde.net ([83.52.2.137]
 helo=localhost.localdomain) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pfGe1-003vRg-Vl; Thu, 23 Mar 2023 09:50:02 +0100
Message-ID: <b32a52db030cc746ee082fa89078898a7d88ad28.camel@igalia.com>
Subject: 2023 X.Org Board of Directors Elections timeline extended, request
 for nominations
From: Ricardo Garcia <rgarcia@igalia.com>
To: members@x.org, events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 libre-soc-dev <libre-soc-dev@lists.libre-soc.org>
Date: Thu, 23 Mar 2023 09:50:01 +0100
In-Reply-To: <19f8b5328550abde46a316189c8cd746339819b0.camel@igalia.com>
References: <c1c2591a7f7c9bcb05b69b08da529ddb8fc8145c.camel@igalia.com>
 <19f8b5328550abde46a316189c8cd746339819b0.camel@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 24 Mar 2023 08:03:32 +0000
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
Cc: board <board@foundation.x.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We are seeking nominations for candidates for election to the X.org
Foundation Board of Directors. However, as we presently do not have
enough nominations to start the election - the decision has been made to
extend the timeline by 2 weeks. Note this is a fairly regular part of
the elections process.

The new deadline for nominations to the X.org Board of Directors is
23:59 UTC on April 2nd, 2023.

The new deadline for membership application or renewals is April 9th,
2023. Membership is required to vote on the elections.

The Board consists of directors elected from the membership. Each year,
an election is held to bring the total number of directors to eight. The
four members receiving the highest vote totals will serve as directors
for two year terms.

The directors who received two year terms starting in 2022 were Emma
Anholt, Mark Filion, Alyssa Rosenzweig and Ricardo Garcia. They will
continue to serve until their term ends in 2024. Current directors whose
term expires in 2023 are Samuel Iglesias Gons=C3=A1lvez, Manasi D Navare,
Lyude Paul and Daniel Vetter.

A director is expected to participate in the fortnightly IRC meeting to
discuss current business and to attend the annual meeting of the X.Org
Foundation, which will be held at a location determined in advance by
the Board of Directors.

A member may nominate themselves or any other member they feel is
qualified. Nominations should be sent to the Election Committee at
elections@x.org.

Nominees shall be required to be current members of the X.Org
Foundation, and submit a personal statement of up to 200 words that will
be provided to prospective voters. The collected statements, along with
the statement of contribution to the X.Org Foundation in the member's
account page on http://members.x.org, will be made available to all
voters to help them make their voting decisions.

Nominations, membership applications or renewals and completed personal
statements must be received no later than 23:59 UTC on April 2nd, 2023.

The slate of candidates will be published April 10th 2023 and candidate
Q&A will begin then. The deadline for Xorg membership applications and
renewals is April 9th, 2023.

Cheers,
Ricardo Garcia, on behalf of the X.Org BoD

