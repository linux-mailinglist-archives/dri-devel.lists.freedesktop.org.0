Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC4F7B2161
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 17:32:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26DD010E688;
	Thu, 28 Sep 2023 15:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C12610E679;
 Thu, 28 Sep 2023 15:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IY6QJvsYOVkfVjESwEsZSzvy5/PW5y+hYpTRWIbF1DE=; b=pO5UG8gbA47CC4mG+FX9JaYnNk
 vAFlPsv/3cTCmvpX2NSU6vkaWRdVD/8C3T1sU481EtvBArnBnu6OnyJ+roHZb80PgZgZfWXIRnZAa
 sr5CvItUmArl+tdgE7lrZvNfSDNwcH+9/+o+3mDqP8WyHf7y6bMUY7E6HtygcBV+AfQwd31oyiloR
 QIEY9lyB54IK9YbOfYfSRluqh5Nq8YM3m+Qg8eAwmqm4WGubGf5uc865NBbTLi6KXirB+YzdT+KIa
 AXibMZXfbavBSrIduDtiv+285Hd/+zDR5nGIXfxyOQGka9NdxG2XyfZ7h0Q8s30Kg79RoJRRo6Ch1
 XCIS5OHg==;
Received: from [83.53.107.208] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qlsze-009KQD-5Y; Thu, 28 Sep 2023 17:31:58 +0200
Message-ID: <801899ab00d617ece02e84c536ae7f7ee64b6794.camel@igalia.com>
Subject: Re: Requests For Proposals for hosting XDC 2024 are now open
From: Ricardo Garcia <rgarcia@igalia.com>
To: events@lists.x.org, xorg-devel@lists.freedesktop.org, 
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 libre-soc-dev <libre-soc-dev@lists.libre-soc.org>
Date: Thu, 28 Sep 2023 17:31:57 +0200
In-Reply-To: <086c491482404be792c72798f5fc840cc5625715.camel@igalia.com>
References: <086c491482404be792c72798f5fc840cc5625715.camel@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
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
Cc: board@foundation.x.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The period to submit XDC 2024 hosting proposals has been extended and
the new deadline is **November 1, 2023**

Please, submit your proposals as soon as possible, thank you!

On Mon, 2023-06-19 at 15:43 +0200, Ricardo Garcia wrote:
> Hello everyone!
>=20
> The X.org board is soliciting proposals to host XDC in 2024. Since XDC
> 2023 is being held in Europe this year, we've decided to host in North
> America. However, the board is open to other locations, especially if
> there's an interesting co-location with another conference.
>=20
> If you're considering hosting XDC, we've assembled a wiki page with
> what's generally expected and needed:
>=20
> https://www.x.org/wiki/Events/RFP/
>=20
> When submitting your proposal, please make sure to include at least the
> key information about the potential location in question, possible
> dates along with estimated costs. Proposals can be submitted to board
> at foundation.x.org until the deadline of *September 17th, 2023*.=20
>=20
> Additionally, an quirk early heads-up to the board if you're
> considering hosting would be appreciated, in case we need to adjust the
> schedule a bit. Also, earlier is better since there generally will be a
> bit of Q&A with organizers.
>=20
> And if you just have some questions about what organizing XDC entails,
> please feel free to chat with previous organizers, or someone from the
> board.
>=20
> Thanks,
> Ricardo Garcia, on behalf of X.Org
>=20

